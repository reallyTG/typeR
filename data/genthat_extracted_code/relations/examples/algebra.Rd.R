library(relations)


### Name: algebra
### Title: Relational Algebra
### Aliases: algebra relation_union relation_intersection relation_symdiff
###   relation_complement relation_cartesian relation_projection
###   relation_selection relation_division relation_join relation_semijoin
###   relation_antijoin relation_remainder %><% %=><% %><=% %=><=% %|><%
###   %><|% %|><|% %|>% %<|% %U%
### Keywords: math

### ** Examples

## projection
Person <-
    data.frame(Name = c("Harry", "Sally", "George", "Helena", "Peter"),
               Age = c(34, 28, 29, 54, 34),
               Weight = c(80, 64, 70, 54, 80),
               stringsAsFactors = FALSE)
Person <- as.relation(Person)
relation_table(Person)
relation_table(relation_projection(Person, c("Age", "Weight")))

## selection
relation_table(R1 <- relation_selection(Person, Age < 29))
relation_table(R2 <- relation_selection(Person, Age >= 34))
relation_table(R3 <- relation_selection(Person, Age == Weight))

## union
relation_table(R1 %U% R2)

## works only for the same domains:
relation_table(R2 | R3)

## complement
relation_table(Person - R2)

## intersection
relation_table(relation_intersection(R2, R3))

## works only for the same domains:
relation_table(R2 & R3)

## symmetric difference
relation_table(relation_symdiff(R2, R3))

## Cartesian product
Employee <-
    data.frame(Name =
               c("Harry", "Sally", "George", "Harriet", "John"),
               EmpId = c(3415, 2241, 3401, 2202, 3999),
               DeptName =
               c("Finance", "Sales", "Finance", "Sales", "N.N."),
	       stringsAsFactors = FALSE)
Employee <- as.relation(Employee)
relation_table(Employee)
Dept <- data.frame(DeptName = c("Finance", "Sales", "Production"),
                   Manager = c("George", "Harriet", "Charles"),
                   stringsAsFactors = FALSE)
Dept <- as.relation(Dept)
relation_table(Dept)

relation_table(Employee %><% Dept)

## Natural join
relation_table(Employee %|><|% Dept)

## left (outer) join
relation_table(Employee %=><% Dept)

## right (outer) join
relation_table(Employee %><=% Dept)

## full outer join
relation_table(Employee %=><=% Dept)

## antijoin
relation_table(Employee %|>% Dept)
relation_table(Employee %<|% Dept)

## semijoin
relation_table(Employee %|><% Dept)
relation_table(Employee %><|% Dept)

## division
Completed <-
    data.frame(Student = c("Fred", "Fred", "Fred", "Eugene",
                           "Eugene", "Sara", "Sara"),
               Task = c("Database1", "Database2", "Compiler1",
                        "Database1", "Compiler1", "Database1",
                        "Database2"),
               stringsAsFactors = FALSE)
Completed <- as.relation(Completed)
relation_table(Completed)
DBProject <- data.frame(Task = c("Database1", "Database2"),
                        stringsAsFactors = FALSE)
DBProject <- as.relation(DBProject)
relation_table(DBProject)

relation_table(Completed %/% DBProject)

## division remainder
relation_table(Completed %% DBProject)




