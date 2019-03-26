library(Rglpk)


### Name: Rglpk_read_file
### Title: Interface to GLPK's file reader
### Aliases: Rglpk_read_file print.MP_data_from_file
### Keywords: IO utilities

### ** Examples

## read a CPLEX LP file
x <- Rglpk_read_file( system.file(file.path("examples", "plan.lp"), package
= "Rglpk"), type = "CPLEX_LP")
x
## optimal solution: 296.2166
Rglpk_solve_LP(x$objective, x$constraints[[1]], x$constraints[[2]],
                x$constraints[[3]], x$bounds, x$types, x$maximum)
## read a MATHPROG file
x <- Rglpk_read_file( system.file(file.path("examples", "assign.mod"), package
= "Rglpk"), type = "MathProg")
x
## optimal solution: 76
Rglpk_solve_LP(x$objective, x$constraints[[1]], x$constraints[[2]],
                x$constraints[[3]], x$bounds, x$types, x$maximum)
## read a MATHPROG file
x <- Rglpk_read_file( system.file(file.path("examples", "plan.mps"), package
= "Rglpk"), type = "MPS_fixed")
x
## optimal solution: 296.2166
Rglpk_solve_LP(x$objective, x$constraints[[1]], x$constraints[[2]],
                x$constraints[[3]], x$bounds, x$types, x$maximum)



