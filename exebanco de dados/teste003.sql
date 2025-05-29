-- TABELAS DE DADOS:
CREATE TABLE veiculos (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(250) NOT NULL,
    marca VARCHAR(250) NOT NULL,
    ano INT,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE clientes (
    id_clientes INT PRIMARY KEY AUTO_INCREMENT,
    nome_clientes VARCHAR(150) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE vendedores (
    id_vendedores INT PRIMARY KEY AUTO_INCREMENT,
    nome_vendedor VARCHAR(100) NOT NULL,
    comissao DECIMAL(10, 2)
);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    id_clientes INT NOT NULL,
    id_vendedores INT NOT NULL,
    data_venda DATE,
    valor_venda DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo),
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (id_vendedores) REFERENCES vendedores(id_vendedores)
);

-- INSERÇÃO DE DADOS:

INSERT INTO veiculos(id_veiculo, modelo, marca, ano, preco) VALUES
(1, 'Corolla', 'Toyota', 2022, 95000),
(2, 'Civic', 'Honda', 2023, 105000),
(3, 'Onix', 'Chevrolet', 2021, 75000);

INSERT INTO clientes(id_clientes, nome_clientes, telefone) VALUES
(1, 'Carlos Silva', '61988887777'),
(2, 'Ana Souza', '61999996666'),
(3, 'João Pereira', '61888885555');

INSERT INTO vendedores(id_vendedores, nome_vendedor, comissao) VALUES
(1, 'Fernanda Lima', 0.05),
(2, 'Roberto Carlos', 0.04);

INSERT INTO vendas(id_venda, id_veiculo, id_clientes, id_vendedores, data_venda, valor_venda) VALUES
(1, 1, 1, 1, '2025-05-20', 93000.00), 
(2, 2, 2, 2, '2025-05-22', 102000.00),
(3, 3, 3, 1, '2025-05-23', 74000.00);

-- CONSULTAS:
SELECT * FROM veiculos;
SELECT * FROM clientes;
SELECT * FROM vendedores;
SELECT * FROM vendas;

-- Adicionar a coluna cor na tabela veiculos
ALTER TABLE veiculos
ADD COLUMN cor VARCHAR(50);

-- Atualizar a coluna 'cor' para os registros existentes
UPDATE veiculos SET cor = 'Preto' WHERE id_veiculo = 1;       -- Corolla
UPDATE veiculos SET cor = 'Branco' WHERE id_veiculo = 2;      -- Civic
UPDATE veiculos SET cor = 'Prata' WHERE id_veiculo = 3;       -- Onix

-- Atualizar o telefone do cliente 'João Pereira'

UPDATE clientes SET telefone = '61777774444' WHERE id_cliente = 3;
-- Alternativamente, se o nome for único:
-- UPDATE clientes SET telefone = '61777774444' WHERE nome = 'João Pereira';

-- Excluir da tabela vendas a venda de id_venda = 3
DELETE FROM vendas WHERE id_venda = 3;

-- Verificando as alterações (opcional)
SELECT * FROM veiculos;
SELECT * FROM clientes;
SELECT * FROM vendas;
