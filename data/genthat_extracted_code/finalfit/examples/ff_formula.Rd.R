library(finalfit)


### Name: ff_formula
### Title: Generate formula as character string
### Aliases: ff_formula finalfit_formula
### Keywords: internal

### ** Examples

explanatory = c("age", "nodes", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"
ff_formula(dependent, explanatory)



