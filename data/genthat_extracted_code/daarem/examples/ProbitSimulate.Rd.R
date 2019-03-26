library(daarem)


### Name: ProbitSimulate
### Title: Simulate Data from a Probit Regression Model
### Aliases: ProbitSimulate
### Keywords: probit regression

### ** Examples

n <- 200
npars <- 5
true.beta <- .5*rt(npars, df=2) + 2
XX <- matrix(rnorm(n*npars), nrow=n, ncol=npars)
yy <- ProbitSimulate(true.beta, XX)



