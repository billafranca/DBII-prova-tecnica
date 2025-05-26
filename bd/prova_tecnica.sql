-- LOJA PASCOTTO --






-- faezendo uma prova técnica de banco de dados --
CREATE TABLE Fornecedores (
    idFornecedor INT PRIMARY KEY,
    nome VARCHAR(100),
    CNPJ VARCHAR(20),
    telefone VARCHAR(15)
);

CREATE TABLE Colaboradores (
    idColaborador INT PRIMARY KEY,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);

CREATE TABLE Produtos (
    idProduto INT PRIMARY KEY,
    nome VARCHAR(100),                      -- varchar (100) significa que o campo só aceita até 100 caracteres --
    preco DECIMAL(10,2),
    quantidade_em_estoque INT,
    idFornecedor INT,
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedores(idFornecedor)
);

CREATE TABLE Pedidos (
    idPedido INT PRIMARY KEY,
    data DATE,
    idColaborador INT,
    idProduto INT,
    quantidade INT,
    FOREIGN KEY (idColaborador) REFERENCES Colaboradores(idColaborador),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);

-- Adiciona o campo email em Fornecedores -- 
ALTER TABLE Fornecedores ADD email VARCHAR(100);


CREATE TABLE Categorias (
    idCategoria INT PRIMARY KEY,
    nomeCategoria VARCHAR(100)
);

-- Adiciona o campo idCategoria à tabela Produtos--
ALTER TABLE Produtos ADD idCategoria INT;

-- Cria chave estrangeira entre Produtos e Categorias--
ALTER TABLE Produtos
ADD CONSTRAINT fk_categoria
FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria);

-- Inserção de dados nas tabelas --
INSERT INTO Fornecedores VALUES
(1, 'Fornecedor 1', '12345678912345678912', '11999999999', 'fornecedor1@email.com'),
(2, 'Fornecedor 2', '98765432198765432198', '1111111111', 'fornecedor2@email.com');

INSERT INTO Colaboradores VALUES
(1, 'josias malaquias', 'vendedor', 2500.00),
(2, 'joão sabugo', 'atendente', 2200.00);

INSERT INTO Categorias VALUES
(1, 'Eletrônicos'),
(2, 'peças automotivas'),

INSERT INTO Produtos VALUES
(1, 'Celular', 1200.00, 10, 1, 1),
(2, 'macaco', 30.00, 50, 2, 2);

INSERT INTO Pedidos VALUES
(1, '2025-05-25', 1, 1, 2),
(2, '2025-05-25', 2, 2, 3);


-- a coluna cpf foi removida da tabela, como pedido na questão --

-- essa é a atualização do salário como pedido na questão -- 
UPDATE Colaboradores
SET salario = 2600.00
WHERE idColaborador = 1;

--  Consulta: exibir nome do produto junto com o nome do fornecedor --
SELECT Produtos.nome AS Produto, Fornecedores.nome AS Fornecedor
FROM Produtos
JOIN Fornecedores ON Produtos.idFornecedor = Fornecedores.idFornecedor;
