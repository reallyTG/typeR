library(MultiVarSel)


### Name: whitening_test
### Title: This function provides the p-value of an adaptation of the
###   Portmanteau statistic to test if there is some dependence in the rows
###   of the residuals matrix given as an argument of the function.
### Aliases: whitening_test

### ** Examples

data(copals_camera)
Y=scale(Y[,1:100])
X <- model.matrix( ~ group + 0)
residuals=lm(as.matrix(Y)~X-1)$residuals
whitening_test(residuals)



