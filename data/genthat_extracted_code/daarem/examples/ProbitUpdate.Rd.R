library(daarem)


### Name: ProbitUpdate
### Title: EM Algorithm Update for Probit Regression
### Aliases: ProbitUpdate
### Keywords: probit regression

### ** Examples

n <- 200
npars <- 5
true.beta <- .5*rt(npars, df=2) + 2
XX <- matrix(rnorm(n*npars), nrow=n, ncol=npars)
yy <- ProbitSimulate(true.beta, XX)

initial.beta <- rep(0.0, npars)
new.beta <- ProbitUpdate(initial.beta, XX, yy)



