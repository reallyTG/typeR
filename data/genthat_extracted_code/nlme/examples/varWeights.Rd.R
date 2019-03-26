library(nlme)


### Name: varWeights
### Title: Extract Variance Function Weights
### Aliases: varWeights varWeights.varComb varWeights.varFunc
### Keywords: models

### ** Examples

vf1 <- varPower(form=~age)
vf1 <- Initialize(vf1, Orthodont)
coef(vf1) <- 0.3
varWeights(vf1)[1:10]



