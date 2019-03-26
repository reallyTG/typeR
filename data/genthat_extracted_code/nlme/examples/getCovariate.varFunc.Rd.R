library(nlme)


### Name: getCovariate.varFunc
### Title: Extract varFunc Covariate
### Aliases: getCovariate.varFunc
### Keywords: models

### ** Examples

vf1 <- varPower(1.1, form = ~age)
covariate(vf1) <- Orthodont[["age"]]
getCovariate(vf1)



