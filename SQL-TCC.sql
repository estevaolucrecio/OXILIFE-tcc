create database oxilifetcc
use oxilifetcc

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Galao (
    galao_id INT  PRIMARY KEY,
    descricao VARCHAR(100),
    preco_unitario DECIMAL(10,2),
    quantidade_estoque INT
);

CREATE TABLE Pedidos (
    pedido_id INT  PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    status VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

CREATE TABLE Itens_Pedido (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    galao_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (galao_id) REFERENCES Galao(galao_id)
);

CREATE TABLE Entregas (
    entrega_id INT PRIMARY KEY,
    pedido_id INT,
    data_entrega DATE,
    status VARCHAR(50),
    endereco_entrega VARCHAR(255),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id)
);

CREATE TABLE Funcionarios (
    funcionario_id INT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    telefone VARCHAR(15)
);

CREATE TABLE Transportadoras (
    transportadora_id INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE Entregas_Transportadoras (
    entrega_transportadora_id INT PRIMARY KEY,
    entrega_id INT,
    transportadora_id INT,
    FOREIGN KEY (entrega_id) REFERENCES Entregas(entrega_id),
    FOREIGN KEY (transportadora_id) REFERENCES Transportadoras(transportadora_id)
);
