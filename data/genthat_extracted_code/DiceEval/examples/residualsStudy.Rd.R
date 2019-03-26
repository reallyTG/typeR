library(DiceEval)


### Name: residualsStudy
### Title: Plot residuals
### Aliases: residualsStudy
### Keywords: models

### ** Examples

data(dataIRSN5D)
X <- dataIRSN5D[,1:5]
Y <- dataIRSN5D[,6]
library(gam)
modAm <- modelFit(X,Y,type = "Additive",formula=formulaAm(X,Y))
residualsStudy(modAm)



