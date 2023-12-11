# hw7-ddl.sql

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
drop table if exists peopleroles;
drop table if exists peopleskills;
drop table if exists people;
drop table if exists skills;
drop table if exists roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

drop table if exists skills;
create table skills ( 
    id int auto_increment,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL DEFAULT '(default description)',
    tag varchar(255) NOT NULL,
    primary key(id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (id, name, tag) values
    (1, 'tap dancing', 'Skill 1'),
    (2, 'napping', 'Skill 2'),
    (3, 'procrastinating', 'Skill 3'),
    (4, 'bowling', 'Skill 4'),
    (5, 'time traveling', 'Skill 5'),
    (6, 'underwater breath holding', 'Skill 6'),
    (7, 'singing', 'Skill 7'),
    (8, 'jump roping', 'Skill 8')
    ;

select * from skills;

# Section 4
# Create people(id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.


drop table if exists people;
CREATE TABLE people (
    people_id int,
    people_first_name varchar(256) DEFAULT NULL,
    people_last_name varchar(256) NOT NULL,
    email varchar(256) DEFAULT NULL,
    linkedin_url varchar(4096) DEFAULT NULL,
    headshot_url varchar(4096) DEFAULT NULL,
    discord_handle varchar(256) DEFAULT NULL,
    brief_bio varchar(4096) DEFAULT NULL,
    date_joined date DEFAULT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, people_first_name, people_last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) values
    (1, 'John', 'Person 1', 'john.person1@example.com', 'https://www.linkedin.com/in/johnperson1', 'https://example.com/john_person1.jpg', 'john.person1', 'Bio for Person 1', '2023-01-01'),
    (2, 'Jane', 'Person 2', 'jane.person2@example.com', 'https://www.linkedin.com/in/janeperson2', 'https://example.com/jane_person2.jpg', 'jane.person2', 'Bio for Person 2', '2023-02-01'),
    (3, 'Bob', 'Person 3', 'bob.person3@example.com', 'https://www.linkedin.com/in/bobperson3', 'https://example.com/bob_person3.jpg', 'bob.person3', 'Bio for Person 3', '2023-03-01'),
    (4, 'Alice', 'Person 4', 'alice.person4@example.com', 'https://www.linkedin.com/in/aliceperson4', 'https://example.com/alice_person4.jpg', 'alice.person4', 'Bio for Person 4', '2023-04-01'),
    (5, 'Charlie', 'Person 5', 'charlie.person5@example.com', 'https://www.linkedin.com/in/charlieperson5', 'https://example.com/charlie_person5.jpg', 'charlie.person5', 'Bio for Person 5', '2023-05-01'),
    (6, 'Eve', 'Person 6', 'eve.person6@example.com', 'https://www.linkedin.com/in/eveperson6', 'https://example.com/eve_person6.jpg', 'eve.person6', 'Bio for Person 6', '2023-06-01'),
    (7, 'Frank', 'Person 7', 'frank.person7@example.com', 'https://www.linkedin.com/in/frankperson7', 'https://example.com/frank_person7.jpg', 'frank.person7', 'Bio for Person 7', '2023-07-01'),
    (8, 'Grace', 'Person 8', 'grace.person8@example.com', 'https://www.linkedin.com/in/graceperson8', 'https://example.com/grace_person8.jpg', 'grace.person8', 'Bio for Person 8', '2023-08-01'),
    (9, 'Henry', 'Person 9', 'henry.person9@example.com', 'https://www.linkedin.com/in/henryperson9', 'https://example.com/henry_person9.jpg', 'henry.person9', 'Bio for Person 9', '2023-09-01'),
    (10, 'Ivy', 'Person 10', 'ivy.person10@example.com', 'https://www.linkedin.com/in/ivyperson10', 'https://example.com/ivy_person10.jpg', 'ivy.person10', 'Bio for Person 10', '2023-10-01');
    
select * from people;

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;
create table peopleskills(
    id int auto_increment,
    skills_id int,
    people_id int,
    date_acquired date default (current_date),
    primary key (id),
    foreign key (skills_id) references skills (id) on delete cascade,
    foreign key (people_id) references people (people_id),
    unique (skills_id,people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills (people_id,skills_id) values
    (1,1),   
    (1,3),
    (1,6),
    (2,3),
    (2,4),
    (2,5),
    (3,1),
    (6,2),
    (6,3),
    (6,4),
    (7,3),
    (7,5),
    (7,6),
    (8,1),
    (8,3),
    (8,5),
    (8,6),
    (9,2),
    (9,5),
    (9,6),
    (10,1),
    (10,4),
    (10,5);


select * from peopleskills

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

drop table if exists roles;
create table roles (
    id int auto_increment,
    name varchar(255) NOT NULL,
    sort_priority int,
    primary key (id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (id, name, sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6,'Mentor', 60);

select * from roles;

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

drop table if exists peopleroles;
create table peopleroles (
    id int auto_increment,
    people_id int,
    role_id int,
    date_assigned date default (current_date),
    primary key (id),
    foreign key (people_id) references people (people_id),
    foreign key (role_id) references roles (id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id, role_id) values
    (1, 2),
    (2, 5),
    (2, 6),
    (3, 2),
    (3, 3),
    (4, 4),
    (5, 4),
    (6, 2),
    (6, 1),
    (7, 1),
    (8, 1),
    (8, 3),
    (9, 2),
    (10, 1),
    (10, 3);

select * from peopleroles;

SHOW TABLES; 