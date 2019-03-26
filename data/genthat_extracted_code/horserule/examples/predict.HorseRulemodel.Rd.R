library(horserule)


### Name: predict.HorseRulemodel
### Title: predict.hs
### Aliases: predict.HorseRulemodel

### ** Examples

x = matrix(rnorm(1000), ncol=10)
y = apply(x,1,function(x)sum(x[1:5])+rnorm(1))
hrresmod = HorseRuleFit(X=x, y=y, niter=100, burnin=10)
#predict training data to obtain the fitted values
predict(hrresmod, x, burnin=10)



