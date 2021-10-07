-- ===========01 Table creating =================

create table st(
    eid number(5),
    ename VARCHAR2(10),
    salary varchar2(10),
    hire_date date,
    address_ VARCHAR2(15)
);








-- ==============02 Set Primary key ==================
alter table st
add primary key(eid);

desc st;
select * from st;





-- ==============03 Insert row by substitution =========================
insert into st values(&eid,'&ename','&salary','&hire_date','&address');                 









-- ========== 04 Add two new column ==========
alter table st
add phone VARCHAR2(17);

alter table st
add job_title VARCHAR2(15);



-- ============ 05  query with 30% bonus ============
select ename,job_title,salary+(salary*30/100) "salary+bonus"
from st;






-- ===============06 Minimum Salary Query ==================

select ename,salary from st
where salary =(select min(salary) from st);




-- ============07 Update all job_title ==========
update st 
set job_title= 'manager';


select * from st;





-- =============08 create view =====================

create view v
as select eid,ename,salary from st;

drop view v;

select * from v;




-- ==============09 create sequence ==================
create sequence st_sequence
start with 10
increment by 1
nocycle;


insert into st(eid,ename,salary)values(st_sequence.nextval,'Alim','60000');

desc st;
select st_sequence.nextval from st;



-- ==============10 create index ======================
create index n_index
on st (ename);
