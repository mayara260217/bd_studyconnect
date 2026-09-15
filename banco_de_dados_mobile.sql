-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE StudyConnectMobile;
GO

-- SELECIONA O BANCO E USAR O BANCO DE DADOS
USE StudyConnectMobile;
GO

-- CRIAÇÃO DA TABELA USUARIO
CREATE TABLE Usuario (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);
GO

-- CRIAÇÃO DA TABELA ALUNO

CREATE TABLE Aluno (
    id INT IDENTITY(1,1) PRIMARY KEY,

    -- ID do usuário que pertence a este aluno
    usuario_id INT NOT NULL,

    -- Um usuário só pode estar ligado a um aluno
    CONSTRAINT UQ_Aluno_Usuario UNIQUE (usuario_id),

    -- Relacionamento Usuario -> Aluno
    CONSTRAINT FK_Aluno_Usuario
        FOREIGN KEY (usuario_id)
        REFERENCES Usuario(id)
);
GO

-- CRIAÇÃO DA TABELA CATEGORIA


CREATE TABLE Categoria (
    id INT IDENTITY(1,1) PRIMARY KEY,

    -- Nome da categoria
    nome VARCHAR(100) NOT NULL
);
GO

-- TABELA CURSO


CREATE TABLE Curso (
    id INT IDENTITY(1,1) PRIMARY KEY,

    -- Nome do curso
    nome VARCHAR(150) NOT NULL,

    -- Descrição do curso
    descricao VARCHAR(500),

    -- Categoria à qual o curso pertence
    categoria_id INT NOT NULL,

    -- Relacionamento Curso -> Categoria
    CONSTRAINT FK_Curso_Categoria
        FOREIGN KEY (categoria_id)
        REFERENCES Categoria(id)
);
GO