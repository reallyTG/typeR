library(daarem)


### Name: ProbitLogLik
### Title: Probit Regression Log-Likelihood Function
### Aliases: ProbitLogLik
### Keywords: probit regression

### ** Examples

n <- 200
npars <- 5
true.beta <- .5*rt(npars, df=2) + 2
XX <- matrix(rnorm(n*npars), nrow=n, ncol=npars)
yy <- ProbitSimulate(true.beta, XX)

initial.beta <- rep(0.0, npars)
ll <- ProbitLogLik(initial.beta, XX, yy)



