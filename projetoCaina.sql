--ddl

CREATE TABLE alunos(
	cpf varchar (15) PRIMARY KEY,
	nome_aluno VARCHAR (50) not null,
	idade int ,
	rua text,
	numero varchar(10),
	bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	cep int,
	pais varchar(30)
)

CREATE TABLE telefones (
	cpf varchar(15) references alunos,
	ddd int,
	numero int,
	cod_pais int
) 

CREATE TABLE emails(
	cpf varchar (15)REFERENCES alunos,
	email varchar (64),
	dominio varchar (20)
)

CREATE TABLE departamentos(
	id_dpto serial primary key,
	sigla_dpto varchar(10),
	nome_dpto varchar (15)
)

CREATE TABLE cursos(
	id_curso serial primary key,
	nome_curso varchar (15),
	id_dpto serial references departamentos
)

CREATE TABLE matriculas(
	ra serial primary key,
	cpf varchar (15) references alunos,
	status varchar(10),
	id_curso int references cursos
)

CREATE TABLE disciplinas(
	id_disciplina serial primary key,
	nome_disciplina varchar (15),	
	optativa boolean
)
CREATE TABLE cursos_disciplinas(
	id_curso serial references cursos,
	id_disciplinas serial references disciplinas
)

CREATE TABLE matriculas_disciplinas(
	ra serial references matriculas,
	id_disciplina serial references disciplinas

)

--povoando (dml)



INSERT INTO alunos (cpf, nome_aluno, idade, rua, numero, bairro, cidade, estado, cep, pais)
VALUES
  ('11111111111', 'José Silva', 30, 'Rua X', '123', 'Centro', 'Cidade A', 'Estado A', 12345678, 'Brasil'),
  ('22222222222', 'Ana Oliveira', 25, 'Rua Y', '456', 'Bairro B', 'Cidade B', 'Estado B', 23456789, 'Brasil'),
  ('33333333333', 'Paulo Santos', 35, 'Rua Z', '789', 'Bairro C', 'Cidade C', 'Estado C', 34567890, 'Brasil'),
  ('44444444444', 'Mariana Costa', 28, 'Rua W', '1011', 'Bairro D', 'Cidade D', 'Estado D', 45678901, 'Brasil'),
  ('55555555555', 'Fernanda Fernandes', 32, 'Rua V', '1213', 'Bairro E', 'Cidade E', 'Estado E', 56789012, 'Brasil'),
  ('66666666666', 'Ricardo Lima', 27, 'Rua U', '1415', 'Bairro F', 'Cidade F', 'Estado F', 67890123, 'Brasil'),
  ('77777777777', 'Patrícia Souza', 31, 'Rua T', '1617', 'Bairro G', 'Cidade G', 'Estado G', 78901234, 'Brasil'),
  ('88888888888', 'Luana Pereira', 29, 'Rua S', '1819', 'Bairro H', 'Cidade H', 'Estado H', 89012345, 'Brasil'),
  ('99999999999', 'Carlos Almeida', 33, 'Rua R', '2021', 'Bairro I', 'Cidade I', 'Estado I', 90123456, 'Brasil'),
  ('12345678901', 'Amanda Martins', 26, 'Rua Q', '2223', 'Bairro J', 'Cidade J', 'Estado J', 11223344, 'Brasil');


INSERT INTO telefones (cpf, ddd, numero, cod_pais)
VALUES
  ('11111111111', 11, 999999999, 55),
  ('22222222222', 11, 888888888, 55),
  ('33333333333', 11, 777777777, 55),
  ('44444444444', 11, 666666666, 55),
  ('55555555555', 11, 555555555, 55),
  ('66666666666', 11, 444444444, 55),
  ('77777777777', 11, 333333333, 55),
  ('88888888888', 11, 222222222, 55),
  ('99999999999', 11, 111111111, 55),
  ('12345678901', 11, 000000000, 55);


INSERT INTO emails (cpf, email, dominio)
VALUES
  ('11111111111', 'jose.silva@example.com', 'example.com'),
  ('22222222222', 'ana.oliveira@example.com', 'example.com'),
  ('33333333333', 'paulo.santos@example.com', 'example.com'),
  ('44444444444', 'mariana.costa@example.com', 'example.com'),
  ('55555555555', 'fernanda.fernandes@example.com', 'example.com'),
  ('66666666666', 'ricardo.lima@example.com', 'example.com'),
  ('77777777777', 'patricia.souza@example.com', 'example.com'),
  ('88888888888', 'luana.pereira@example.com', 'example.com'),
  ('99999999999', 'carlos.almeida@example.com', 'example.com'),
  ('12345678901', 'amanda.martins@example.com', 'example.com');


INSERT INTO departamentos (sigla_dpto, nome_dpto)
VALUES
  ('DP1', 'Departamento 1'),
  ('DP2', 'Departamento 2'),
  ('DP3', 'Departamento 3'),
  ('DP4', 'Departamento 4'),
  ('DP5', 'Departamento 5');


INSERT INTO cursos (nome_curso, id_dpto)
VALUES
  ('Curso Um', 1),
  ('Curso Dois', 2),
  ('Curso Três', 3),
  ('Curso Quatro', 4),
  ('Curso Cinco', 5);


INSERT INTO matriculas (cpf, status, id_curso)
VALUES
  ('11111111111', 'Ativo', 1),
  ('22222222222', 'Ativo', 2),
  ('33333333333', 'Ativo', 3),
  ('44444444444', 'Ativo', 4),
  ('55555555555', 'Ativo', 5),
  ('66666666666', 'Ativo', 1),
  ('77777777777', 'Ativo', 2),
  ('88888888888', 'Ativo', 3),
  ('99999999999', 'Ativo', 4),
  ('12345678901', 'Ativo', 5);


INSERT INTO disciplinas (nome_disciplina, optativa)
VALUES
  ('Disciplina 1', false),
  ('Disciplina 2', false),
  ('Disciplina 3', true),
  ('Disciplina 4', false),
  ('Disciplina 5', true);


INSERT INTO cursos_disciplinas (id_curso, id_disciplinas)
VALUES
  (1, 1),
  (1, 2),
  (2, 2),
  (2, 3),
  (3, 3),
  (3, 4),
  (4, 4),
  (4, 5),
  (5, 5),
  (5, 1);

INSERT INTO matriculas_disciplinas (ra, id_disciplina)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 1),
  (7, 2),
  (8, 3),
  (9, 4),
  (10, 5);


-- dql
-- Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.
SELECT * FROM alunos WHERE nome_aluno = 'José Silva';

-- Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.
SELECT * FROM cursos WHERE id_dpto = 3;

--Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT * FROM cursos_disciplinas INNER JOIN disciplinas ON nome_disciplina= 'Disciplina 2';

-- Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT cpf, id_disciplina, nome_disciplina FROM alunos INNER JOIN disciplinas ON cpf = '22222222222';

-- Filtrar todos os alunos matriculados em um determinado curso
SELECT nome_aluno, cpf, nome_curso FROM alunos INNER JOIN cursos ON nome_curso = 'Curso Três';

-- Filtrar todos os alunos matriculados em determinada disciplina
SELECT nome_aluno, cpf, nome_disciplina, id_disciplina FROM alunos INNER JOIN disciplinas ON nome_disciplina = 'Disciplina 5';

-- Filtrar alunos formados.
SELECT * FROM matriculas WHERE status = 'Ativo';
SELECT nome_aluno FROM alunos INNER JOIN matriculas ON alunos.cpf = matriculas.cpf WHERE status = 'Ativo';

-- Filtrar alunos ativos
SELECT nome_aluno FROM alunos INNER JOIN matriculas ON alunos.cpf = matriculas.cpf WHERE status = 'Ativa';

-- Apresentar a quantidade de alunos ativos por curso.
SELECT c.nome_curso,
       (SELECT COUNT(*)
        FROM matriculas m
        WHERE m.id_curso = c.id_curso
          AND m.status = 'Ativa') AS quantidade_alunos_ativos
FROM cursos c;

-- Apresentar a quantidade de alunos ativos por disciplina.
SELECT d.nome_disciplina,
       (SELECT COUNT(*)
        FROM matriculas_disciplinas md
        JOIN matriculas m ON md.ra = m.ra
        WHERE md.id_disciplina = d.id_disciplina
          AND m.status = 'Ativa') AS quantidade_alunos_ativos
FROM disciplinas d;
