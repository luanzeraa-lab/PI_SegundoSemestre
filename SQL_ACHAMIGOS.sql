
 SELECT * FROM USUARIO
CREATE TABLE Usuario
(
    Id_Usuario int identity(1,1) not null,
    Cnpj varchar(20) not null,
    Nome varchar(50) not null,
    Telefone varchar(15) not null,
    UserLogin varchar(20) not null,
    Senha varchar(20) not null,
    Email varchar(40) not null,
    Endereco varchar(80) not null,
    Tipo char(1),
    UserStatus varchar(15),
    Constraint PK_Id Primary Key (Id_Usuario)
);
 
INSERT INTO Usuario (Cnpj, Nome, Telefone, UserLogin, Senha, Email, Endereco, Tipo, UserStatus)
VALUES
('12.345.678/0001-90', 'Empresa Alpha Ltda', '(11) 98765-4321', 'alpha_user', 'Senha123', 'contato@alpha.com.br', 'Rua das Acácias, 123 - São Paulo/SP', 'U', 'Aprovado'),
('98.765.432/0001-01', 'Beta Comércio', '(21) 99876-5432', 'beta2023', 'Beta@456', 'vendas@beta.com.br', 'Av. Brasil, 456 - Rio de Janeiro/RJ', 'U', 'Aprovado'),
('11.222.333/0001-44', 'Gamma Serviços ME', '(31) 91234-5678', 'gamma_serv', 'Gamma789', 'suporte@gamma.com.br', 'Rua Verde, 789 - Belo Horizonte/MG', 'U', 'Aprovado'),
('44.555.666/0001-77', 'Delta Indústria S/A', '(41) 93456-7890', 'delta_ind', 'Delta123!', 'industria@delta.com.br', 'Av. Paraná, 321 - Curitiba/PR', 'U', 'Aprovado'),
('77.888.999/0001-22', 'Epsilon Ltda', '(51) 97654-3210', 'epsilon2025', 'Eps456@!', 'adm@epsilon.com.br', 'Rua Azul, 654 - Porto Alegre/RS', 'U', 'Aprovado');
 
CREATE TABLE Animais
(
    Cod_Animal int identity(1,1) not null,
    IDUsuario int,
    Especie varchar(20) not null,
    Nome_Animal varchar(20),
    Peso decimal(4,2),
    Tamanho varchar(10),
    Castrado char(1),
    AnimalStatus varchar(15),
    Observacoes varchar(500),
    Constraint PK_Cod Primary key (Cod_Animal),
    Constraint FK_Usuario_ID_Usuario Foreign key(IDUsuario) References Usuario(Id_Usuario)
);
 
INSERT INTO Animais (IDUsuario, Especie, Nome_Animal, Peso, Tamanho, Castrado, AnimalStatus, Observacoes)
VALUES
(1, 'Cachorro', 'Bolt', 12.50, 'Médio', 'S', 'Aprovado', 'Animal dócil, se dá bem com crianças.'),
(2, 'Gato', 'Mimi', 4.20, 'Pequeno', 'S', 'Aprovado', 'Gosta de lugares altos e é muito curioso.'),
(3, 'Cachorro', 'Snowball', 2.10, 'Pequeno', 'N', 'Aprovado', 'Precisa de acompanhamento veterinário mensal.'),
(4, 'Cachorro', 'Thor', 30.75, 'Grande', 'S', 'Aprovado', 'Animal resgatado, ainda um pouco arisco.'),
(5, 'Papagaio', 'Louro', 1.25, 'Pequeno', 'N', 'Aprovado', 'Fala algumas palavras, muito sociável.');
 
CREATE TABLE Vacinas
(
    Cod_Vacina int identity(1,1) not null,
    IDUsuario int,
    Nome_Vacina varchar(50),
    Duracao varchar(20),
    Constraint PK_CodVac Primary Key (Cod_Vacina),
    Constraint FK_UsuarioIDUsuario Foreign key(IDUsuario) References Usuario(Id_Usuario)
);
 
INSERT INTO Vacinas (IDUsuario, Nome_Vacina, Duracao)
VALUES
(1, 'Antirrábica', '1 ano'),
(2, 'V8 Canina', '1 ano'),
(3, 'V4 Felina', '1 ano'),
(4, 'Giárdia', '6 meses'),
(5, 'Bronchi-Shield', '1 ano');
 
CREATE TABLE Eventos
(
    Id_Evento int identity(1,1) not null,
    IDUsuario int,
    Data_Publicacao date not null,
    Data_Exclusao date not null,
    Tipo_Evento varchar(40),
    Texto varchar(500),
    EventoStatus varchar(15),
    Constraint PK_CodEve Primary Key (Id_Evento),
    Constraint FK_Usuario_IDUsuario Foreign key(IDUsuario) References Usuario(Id_Usuario)
);
 
INSERT INTO Eventos (IDUsuario, Data_Publicacao, Data_Exclusao, Tipo_Evento, EventoStatus)
VALUES
(1, '2025-01-15', '2025-02-15', 'Feira de Adoção de Animais', 'Aprovado'),
(2, '2025-03-10', '2025-03-20', 'Campanha de Vacinação Gratuita', 'Aprovado'),
(3, '2025-04-05', '2025-04-30', 'Oficina de Cuidados com Animais', 'Aprovado'),
(4, '2025-05-01', '2025-05-10', 'Evento de Castração Solidária', 'Aprovado'),
(5, '2025-06-01', '2025-06-30', 'Mês da Conscientização Animal', 'Aprovado');
 
CREATE TABLE Animais_Vacinas
(
    Id_AnimaisVacinas int identity(1,1) not null,
    DataVacina date,
    Outros varchar(80),
    CodVacina int,
    CodAnimal int,
    Constraint PK_CodAniVac Primary Key (Id_AnimaisVacinas),
    Constraint FK_VacinaID Foreign key(CodVacina) References Vacinas(Cod_Vacina),
    Constraint FK_AnimaisId Foreign key(CodAnimal) References Animais(Cod_Animal)
);
 
INSERT INTO Animais_Vacinas (DataVacina, Outros, CodVacina, CodAnimal)
VALUES
('2025-01-10', 'Dose única - aplicada na clínica central', 1, 1),
('2025-02-15', 'Reforço anual agendado', 2, 2),
('2025-03-05', 'Animal apresentou leve reação', 3, 3),
('2025-04-20', 'Vacina aplicada durante campanha pública', 4, 4),
('2025-05-18', 'Aplicação feita em domicílio', 5, 5);
 
CREATE TABLE Foto_Animal
(
    Id_FtAni int identity(1,1) not null,
    CodAnimal int,
    Foto varchar(100),
    Constraint PK_IdFotoAni Primary Key (Id_FtAni),
    Constraint FK_Animais_Cod_Animal Foreign key(CodAnimal) References Animais(Cod_Animal)
);
 
INSERT INTO Foto_Animal (CodAnimal, Foto)
VALUES
(1, 'bolt.jpg'),
(2, 'mimi.jpg'),
(3, 'snowball.jpg'),
(4, 'thor.jpg'),
(5, 'louro.jpg');
 
CREATE TABLE Foto_Eventos
(
    Id_FtEvento int identity(1,1) not null,
    CodEvento int,
    Foto varchar(100),
    Constraint PK_IdFotoEve Primary Key (Id_FtEvento),
    Constraint FK_Eventos_ID_Evento Foreign key(CodEvento) References Eventos(Id_Evento)
);
 
INSERT INTO Foto_Eventos (CodEvento, Foto)
VALUES
(1, 'feira_adocao_1.jpg'),
(2, 'campanha_vacinacao_1.jpg'),
(3, 'oficina_cuidados_1.jpg'),
(4, 'castracao_solidaria_1.jpg'),
(5, 'conscientizacao_animal_1.jpg');