library(nlme)


### Name: Covariate.varFunc
### Title: Assign varFunc Covariate
### Aliases: covariate<-.varFunc
### Keywords: models

### ** Examples

vf1 <- varPower(1.1, form = ~age)
covariate(vf1) <- Orthodont[["age"]]



