create extension if not exists "uuid-ossp";

create table roles (
    id serial primary key,
    nombre_rol varchar(50) not null 
);

insert into roles (nombre_rol) values ('Administrador'), ('Usuario');

create table usuarios (
    id uuid default uuid_generate_v4() primary key,
    nombre varchar(100) not null,
    correo varchar(100) unique not null,
    rol_id int references roles(id) default 2,
    creado_en timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Tabla adaptada al sistema vial
create table infracciones (
    id serial primary key,
    articulo varchar(50) not null,
    descripcion text not null,
    multa_aproximada varchar(50) not null
);

create table resultados_evaluacion (
    id serial primary key,
    usuario_id uuid references usuarios(id),
    puntaje int not null,
    total_preguntas int not null,
    fecha timestamp with time zone default timezone('utc'::text, now()) not null
);