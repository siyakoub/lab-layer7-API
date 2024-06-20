drop database if exists layer7Bdd;
create database layer7Bdd;
use layer7Bdd;
drop table if exists user;
create table user(
    id int not null primary key,
    lastName varchar(50) not null,
    firstName varchar(50) not null,
    email varchar(254) not null,
    dateInscription datetime not null,
    statut ENUM('ACTIF', 'INACTIF', 'BLOCKED')
);

drop table if exists admin;
create table admin(
    id int not null primary key,
    niveau varchar(50) not null,
    idUser int not null,
    foreign key (idUser) references user(id)
);

drop table if exists customer;
create table customer(
    id int not null primary key,
    customerNumber int not null,
    idUser int not null,
    foreign key (idUser) references user(id)
);

drop table if exists histoRequest;
create table histoRequest(
    id int not null primary key,
    nameRequest varchar(50) not null,
    request varchar(50) not null,
    path varchar(254) not null,
    statut enum('success', 'fail', 'in progress', 'canceled')
);

alter table user
    ADD INDEX idx_adresseEmail (email);

drop table if exists session;
create table session(
    id int not null primary key,
    user_email varchar(254) not null,
    token varchar(254) not null,
    dateDebutSession datetime not null,
    dateFinSession datetime not null,
    actif int not null,
    foreign key (user_email) references user(email)
);


