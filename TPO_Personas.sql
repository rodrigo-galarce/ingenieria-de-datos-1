CREATE DATABASE Personas;
GO

''' Tablas '''
CREATE TABLE Tabla1 (
    cod_color INT PRIMARY KEY,
    nombre_color NVARCHAR(50)
)

CREATE TABLE Tabla2 (
    cod_comida_favorita INT PRIMARY KEY,
    nombre_comida_favorita NVARCHAR(50)
)

CREATE TABLE Persona (
    cod_persona INT PRIMARY KEY,
    nombre_persona NVARCHAR(50),
    cod_color INT FOREIGN KEY REFERENCES Tabla1(cod_color),
    cod_comida_favorita INT FOREIGN KEY REFERENCES Tabla2(cod_comida_favorita)
)

ALTER TABLE Persona ADD apellido_persona NVARCHAR(50);

''' Cambio de nombre Tablas 1 y 2 '''
EXEC sp_rename Tabla1 'ColorFavorito'
EXEC sp_rename Tabla2 'ComidaFavorita'

''' Procedimientos almacenados '''
CREATE PROCEDURE sp_agregar_colores
@cod_color INT,
@nombre_color NVARCHAR(50)
AS
BEGIN
INSERT INTO ColorFavorito(cod_color, nombre_color)
VALUES (@cod_color, @nombre_color)
END;

CREATE PROCEDURE sp_agregar_comida_fav
@cod_comida INT,
@nombre_comida NVARCHAR(50)
AS
BEGIN
INSERT INTO ComidaFavorita(cod_comida_favorita, nombre_comida_favorita)
VALUES (@cod_comida, @nombre_comida)
END;

CREATE PROCEDURE sp_agregar_persona
@dni INT,
@nombre NVARCHAR(50),
@color_fav INT,
@comida_fav INT
AS
BEGIN
INSERT INTO Persona(cod_persona, nombre_persona, cod_color, cod_comida_favorita)
VALUES (@dni, @nombre, @color_fav, @comida_fav)
END;

EXEC sp_agregar_colores 1, 'Rojo'