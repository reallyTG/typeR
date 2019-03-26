library(daarem)


### Name: fpiter
### Title: Fixed-Point Iteration Scheme
### Aliases: fpiter
### Keywords: optimization EM algorithm

### ** Examples


### Generate outcomes from a probit regression model
n <- 1000
npars <- 5
true.beta <- .5*rt(npars, df=2) + 1
XX <- matrix(rnorm(n*npars), nrow=n, ncol=npars)
yy <- ProbitSimulate(true.beta, XX)
max.iter <- 1000
beta.init <- rep(0.0, npars)

### EM algorithm for estimating parameters from probit regression

em.probit <- fpiter(par=beta.init, fixptfn = ProbitUpdate, X=XX, y=yy,
                    control=list(maxiter=max.iter))



