DROP TABLE IF EXISTS Internacao;
DROP TABLE IF EXISTS Medico;
DROP TABLE IF EXISTS Departamento;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Paciente;
DROP TABLE IF EXISTS Leito;


CREATE TABLE Departamento (
  id SERIAL PRIMARY KEY,
  nome_dep VARCHAR NOT NULL UNIQUE
);


CREATE TABLE Usuario (
  id SERIAL PRIMARY KEY,
  nome VARCHAR NOT NULL,
  login VARCHAR NOT NULL UNIQUE,
  senha VARCHAR NOT NULL,
  permissoes VARCHAR NOT NULL
);

CREATE TABLE Paciente (
  id SERIAL PRIMARY KEY,
  cpf VARCHAR NOT NULL UNIQUE,
  nome VARCHAR NOT NULL,
  data_nascimento DATE NOT NULL,
  rua VARCHAR NOT NULL,
  bairro VARCHAR NOT NULL,
  cidade VARCHAR NOT NULL,
  pais VARCHAR NOT NULL
);

CREATE TABLE Medico (
  id SERIAL PRIMARY KEY,
  crm VARCHAR NOT NULL UNIQUE,
  login VARCHAR NOT NULL,
  nome_dep VARCHAR NOT NULL,
  FOREIGN KEY (login) REFERENCES Usuario(login),
  FOREIGN KEY (nome_dep) REFERENCES Departamento(nome_dep)
);

CREATE TABLE Leito (
  id SERIAL PRIMARY KEY,
  numero INT NOT NULL UNIQUE,
  tipo VARCHAR NOT NULL
);

CREATE TABLE Internacao (
  id SERIAL PRIMARY KEY,
  data_hora_entrada TIMESTAMP NOT NULL,
  data_hora_saida TIMESTAMP,
  numero INT NOT NULL,
  cpf VARCHAR NOT NULL,
  crm VARCHAR NOT NULL,
  FOREIGN KEY (numero) REFERENCES Leito(numero),
  FOREIGN KEY (cpf) REFERENCES Paciente(cpf),
  FOREIGN KEY (crm) REFERENCES Medico(crm)
);

-- INSERCAO DE DEPARTAMENTOS
INSERT INTO Departamento (nome_dep) VALUES
('Pronto-Socorro'),
('Cardiologia'),
('UTI'),
('Enfermagem'),
('Centro Cirúrgico'),
('Clínica Médica'),
('Pediatria'),
('Obstetrícia'),
('Psiquiatria'),
('Administração'),
('Neurologia'),           
('Ortopedia'),   
('Estoque'),         
('Gastroenterologia'),
('Radiologia'),
('Pneumologia');

-- INSERCAO DE LEITOS
INSERT INTO Leito (numero, tipo) VALUES
(1, 'Clínico'),          -- Para pacientes como Benjamin (DPOC) ou Samuel (Dengue)
(2, 'Semi-Intensiva'),    -- Para pacientes que precisam de monitoramento cardíaco, como Sérgio
(3, 'Clínico'),          -- Outro leito clínico para casos gerais
(4, 'Psiquiátrico'),      -- Para pacientes em crise, como Helena
(5, 'UTI Geral'),         -- Para paciente em estado grave
(6, 'Clínico'),
(7, 'Maternidade'),       -- Para simular uma paciente em parto
(8, 'Pediatria'),         -- Para paciente pediátrico
(9, 'Cirúrgico'),         -- Para paciente em pós-operatório
(10, 'Isolamento'),       -- Para paciente com doença contagiosa (ex: Dengue grave)
(11, 'Clínico'),
(12, 'Semi-Intensiva'),
(13, 'UTI Geral'),
(14, 'Psiquiátrico'),
(15, 'Cirúrgico'),
(16, 'Pediatria');


-- INSERCAO DE USUARIOS
INSERT INTO Usuario (nome, login, senha, permissoes) VALUES 
('Carol Alves', 'carolalves', 'carol123', 'Administradora'),
('Marta Ribeiro', 'martaribeiro', 'marta789', 'Enfermeira'),
('Dr. Pedro Lima', 'pedrolima', 'pedro456', 'Médico'),
('Dr. Felipe Santos', 'felipesantos', 'felipe654', 'Médico'),
('Mariana Costa', 'marianacosta', 'mariana852', 'Enfermeira'),
('Dr. Ricardo Almeida', 'ricardoalmeida', 'ricardo159', 'Médico'),
('Dr. Eduardo Fernandes', 'eduardofernandes', 'eduardo258', 'Médico'),
('Beatriz Silva', 'beatrizsilva', 'beatriz369', 'Enfermeira'),
('Dr. Thiago Rocha', 'thiagorocha', 'thiago963', 'Médico'),
('Fernanda Lima', 'fernandalima', 'fernanda741', 'Enfermeira'),
('Dr. Rafael Moreira', 'rafaelmoreira', 'rafael852', 'Médico'),
('Dr. Gustavo Carvalho', 'gustavocarvalho', 'gustavo456', 'Médico'),
('Larissa Oliveira', 'larissaoliveira', 'larissa753', 'Enfermeira'),
('Marcos da Silva', 'marcosdasilva', 'marcos654', 'Supervisor'),
('Dr. Vinicius Alves', 'viniciusalves', 'vinicius837', 'Médico'),
('Yuri Araujo', 'yuriaraujo', 'yuri625', 'Enfermeiro'),
('Dr. Fabiano Souza', 'fabianosouza', 'fabiano917', 'Médico'),
('Vitória Pereira', 'vitoriapereira', 'vitoria204', 'Enfermeira'),
('Dr. Amanda Martins', 'amandamartins', 'amanda321', 'Médico'),
('Dr. Beatriz Costa', 'beatrizcosta', 'beatriz856', 'Médico'),
('Rafael Gomes', 'rafaelgomes', 'rafael478', 'Enfermeiro'),
('Dr. Lucas Ribeiro', 'lucasribeiro', 'lucas145', 'Médico'),
('Mariana Souza', 'marianasouza', 'mariana369', 'Enfermeira'),
('Thiago Mendes', 'thiagomendes', 'thiago258', 'Enfermeiro'),
('Jorge Costa', 'jorgecosta', 'jorge482', 'Médico'),
('Amanda Nunes', 'amandanunes', 'amanda753', 'Médico'),
('Lucas Nunes', 'lucasnunes', 'lucas159', 'Médico');

-- INSERCAO DE MEDICOS
INSERT INTO Medico (crm, login, nome_dep) VALUES
('CE123456', 'pedrolima', 'Cardiologia'),
('RJ234567', 'felipesantos', 'Neurologia'),
('SP345678', 'ricardoalmeida', 'Cardiologia'),
('BA456789', 'eduardofernandes', 'Pediatria'),
('RS567890', 'thiagorocha', 'Ortopedia'),
('PE678901', 'rafaelmoreira', 'Clínica Médica'),
('PR789012', 'gustavocarvalho', 'Gastroenterologia'),
('MG890123', 'viniciusalves', 'UTI'),
('RJ901234', 'fabianosouza', 'Clínica Médica'),
('AM012345', 'amandamartins', 'Obstetrícia'),
('GO101112', 'beatrizcosta', 'Pediatria'),
('CE121314', 'lucasribeiro', 'Cardiologia'),
('CE838182', 'jorgecosta', 'Radiologia'),
('CE616263', 'amandanunes', 'Pneumologia'),
('CE515253', 'lucasnunes', 'Psiquiatria');


-- INSERCAO DE PACIENTES
INSERT INTO Paciente(cpf, nome, data_nascimento, rua, bairro, cidade, pais) VALUES
('15919081325', 'Benjamin Heitor Ramos', '1968-07-08', 'Rua 715', 'Conjunto Ceará', 'Fortaleza', 'Brasil'),
('72219489760', 'Felipe Guilherme Lopes', '1948-07-13', 'Rua Comerciante Assis Vieira', 'De Lourdes', 'Fortaleza', 'Brasil'),
('95563215008', 'Helena Emilly Amanda Martins', '1994-02-19', 'Rua Bruno Ângelo de Figueiredo', 'Brejo Seco', 'Juazeiro do Norte', 'Brasil'),
('76129904827', 'Sérgio Matheus Nascimento', '1945-10-09', 'Vila Paissandu', 'Jardim América', 'Fortaleza', 'Brasil'),
('43727104295', 'Fernanda Marlene dos Santos', '1994-06-18', 'Rua Principal, s/n', 'Centro', 'Patos', 'Brasil'),
('61235916065', 'Samuel Cláudio da Conceição', '1973-07-10', 'Rua Raimundo Simplício de Carvalho 512', 'Centro', 'Chorozinho', 'Brasil'),
('31877804827', 'Caleb Marcelo Freitas', '1961-05-11', 'Praça Maciel de Brito', 'Bela Vista', 'Fortaleza', 'Brasil'),
('88116107453', 'Renato Oliver Heitor Pires', '1977-09-23', 'Vila Bruno', 'Benfica', 'Fortaleza', 'Brasil'),
('63685814508', 'Márcio Carlos Eduardo Bernardo Aparício', '2001-10-01', 'Rua Antônio Ferreira de Andrade', 'Jarí', 'Maracanaú', 'Brasil'),
('02868676723', 'Sophie Jennifer Isabelly Fernandes', '2007-08-21', 'Rua Joaquim Alves de Oliveira', 'Leandro Bezerra de Meneses', 'Juazeiro do Norte', 'Brasil'),
('12345678900', 'Ravi Andrade da Silva', '2020-08-21', 'Rua Joaquim Alves de Oliveira', 'Leandro Bezerra de Meneses', 'Juazeiro do Norte', 'Brasil'),
('12345678922', 'Ianara Andrade da Silva', '1999-08-21', 'Rua Joaquim Alves de Oliveira', 'Leandro Bezerra de Meneses', 'Juazeiro do Norte', 'Brasil'),
('12345678933', 'Arthur Andrade da Silva', '1989-08-21', 'Rua Joaquim Alves de Oliveira', 'Leandro Bezerra de Meneses', 'Juazeiro do Norte', 'Brasil');