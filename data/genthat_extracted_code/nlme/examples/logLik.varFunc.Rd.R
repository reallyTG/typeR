library(nlme)


### Name: logLik.varFunc
### Title: Extract varFunc logLik
### Aliases: logLik.varFunc logLik.varComb
### Keywords: models

### ** Examples

vf1 <- varPower(form = ~age)
vf1 <- Initialize(vf1, Orthodont)
coef(vf1) <- 0.1
logLik(vf1)



