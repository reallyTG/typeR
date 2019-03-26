library(sampleSelection)


### Name: linearPredictors
### Title: Calculates linear predictors for different models
### Aliases: linearPredictors linearPredictors.probit
### Keywords: models methods

### ** Examples

data(Mroz87)
Mroz87$kids  <- ( Mroz87$kids5 + Mroz87$kids618 > 0 )
a <- probit(lfp ~ kids + educ + hushrs + huseduc + huswage + mtr +
 motheduc, data=Mroz87)
b <- linearPredictors(a)
cor(Mroz87$lfp, b) # should be positive and highly significant



