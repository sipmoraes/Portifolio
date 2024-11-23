SHOW DATABASES

USE dtb_gestao_faculdade

SHOW TABLES

# CADASTRO ALUNO / CURSO / DISCIPLINA / PROFESSOR

CREATE TABLE tbl_aluno_matricula (
	id_matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_matricula DATE,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE);

       
    
    CREATE TABLE tbl_curso (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	duracao DATE NOT NULL,
    UNIQUE INDEX (id) );
  
    
	CREATE TABLE tbl_disciplina (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	carga_horaria INT NOT NULL,
    UNIQUE INDEX (id)  );

  
	CREATE TABLE tbl_professor (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
	qualificacao VARCHAR (100) );
    

        
    # ATRIBUTOS MULTIVALORADOS - GEROU TABELA DE TELEFONES
    
    CREATE TABLE tbl_telefone (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero varchar(45) not null,
	id_matricula  INT,
    id_professor INT,
    
    CONSTRAINT fk_aluno_telefone
	FOREIGN KEY (id_matricula )
	REFERENCES tbl_aluno_matricula (id_matricula ),
    
	CONSTRAINT fk_professor_telefone
	FOREIGN KEY (id_professor)
	REFERENCES  tbl_professor (id));
    
    
    
# PARA MONITORAR A NOTA DO ALUNO -    TABELA = ALUNO X DISCIPLINA
    
    CREATE TABLE tbl_aluno_disciplina (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nota DECIMAL (5,2),
  	id_matricula INT,
    id_disciplina INT,
    
    CONSTRAINT fk_aluno_disciplina
	FOREIGN KEY (id_disciplina)
	REFERENCES tbl_disciplina (id),
    
	CONSTRAINT fk_disciplina_aluno
	FOREIGN KEY (id_matricula)
	REFERENCES tbl_aluno_matricula (id_matricula ));

    
        
# PARA MONITORAR MATRICULA / CURSO -    TABELA = ALUNO X CURSO
    
    CREATE TABLE tbl_aluno_curso (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 	id_matricula INT,
    id_curso INT,
    
    CONSTRAINT fk_aluno_curso
	FOREIGN KEY (id_curso)
	REFERENCES tbl_curso (id),
    
	CONSTRAINT fk_curso_aluno
	FOREIGN KEY (id_matricula)
	REFERENCES tbl_aluno_matricula (id_matricula)  );
  
    
	# PARA MONITORAR CURSOS POR DISCIPLINA -    TABELA =  CURSO x DISCIPLINA
    
    CREATE TABLE tbl_curso_disciplinas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 	id_curso INT,
    id_disciplina INT,
    
    CONSTRAINT fk_curso_disciplina
	FOREIGN KEY (id_disciplina)
	REFERENCES tbl_disciplina (id),
    
	CONSTRAINT fk_disciplina_curso
	FOREIGN KEY (id_curso)
	REFERENCES  tbl_curso (id );
   
    
    
# PARA MONITORAR PROFESSORES POR DISCIPLINA -    TABELA = PROFESSOR x DISCIPLINA
    
    CREATE TABLE tbl_professores_disciplinas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 	id_professor INT,
    id_disciplina INT,
    
    CONSTRAINT fk_professor_disciplina
	FOREIGN KEY (id_disciplina)
	REFERENCES tbl_disciplina (id),
    
	CONSTRAINT fk_disciplina_professor
	FOREIGN KEY (id_professor)
	REFERENCES  tbl_professor (id));
    
    SHOW TABLES

INSERT INTO tbl_aluno_matricula (data_matricula, nome, cpf)
VALUES 
('2024-03-02', 'Ana Paula Souza', '23456789012'),
('2024-06-06', 'Eduardo da Silva', '34561220123'),
('2024-03-10', 'Maria Eduarda Souza', '23456784562'),
('2024-03-13', 'Jose Alencar', '23456787892'),
('2024-03-24', 'Leticia Souza', '23456147012');


INSERT INTO tbl_curso ( nome, duracao)
VALUES 
('Administracao', '2028-10-23'),
('Geografia', '2026-12-28'),
('Cinecias Contaveis', '2028-12-23'),
('Direto', '2029-11-13'),
('Medicina', '2029-12-06');

 

INSERT INTO tbl_disciplina ( nome, carga_horaria)
VALUES 
('Economia', '220'),
('Matematica Aplicada', '260'),
('Marketing', '300'),
('Ciencia Politica', '200'),
('Anatomia Humana', '360' ),
('Saude Coletiva', '240'),
('Pedriatria', '260'),
('Neurologia', '380');

  
INSERT INTO tbl_professor (nome, cpf,qualificacao)
VALUES 
('Heitor de Oliveira', '12356789012', 'Biologia'),
('Fabio Darvilask', '13661220123', 'Economia'),
('Davi Valentim', '18956784562', 'Matematico'),
('JoseJulio Capachio', '14756787892', 'Arqueolocia');

INSERT INTO tbl_aluno_disciplina (nota, id_matricula, id_disciplina)
VALUES 
('8', '2', '3'),
('10', '3', '4'),
('9', '4', '5');


USE dtb_gestao_faculdade

SELECT * FROM  tbl_aluno_matricula;
SELECT * FROM  tbl_curso;
SELECT * FROM  tbl_disciplina;
SELECT * FROM  tbl_professor;
SELECT * FROM  tbl_aluno_matricula;
SELECT * FROM  tbl_curso;




    
    