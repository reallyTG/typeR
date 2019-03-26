library(bayess)


### Name: loglinll
### Title: Log of the likelihood of the log-linear model
### Aliases: loglinll
### Keywords: log-linear model generalised linear model

### ** Examples

X=matrix(rnorm(20*3),ncol=3)
beta=c(3,-2,1)
y=rpois(20,exp(X%*%beta))
loglinll(beta, y, X)



