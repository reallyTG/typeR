library(mvabund)


### Name: glm1
### Title: Fits a Generalised Linear Models with a LASSO (or L1) penalty,
###   given a value of the penalty parameter.
### Aliases: glm1
### Keywords: models regression

### ** Examples

data(spider)
Alopacce <- spider$abund[,1]
X <- cbind(1,spider$x)
#fit a LASSO-penalised negative binomial GLM, with penalty parameter 10:
ft = glm1(Alopacce,X,lambda=10)

plot(ft$logLs) # a plot of the log-likelihood, each iteration to convergence
coef(ft) # coefficients in the final model




