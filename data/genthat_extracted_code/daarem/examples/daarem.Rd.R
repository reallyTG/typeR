library(daarem)


### Name: daarem
### Title: Damped Anderson Acceleration with Restarts and
###   Epsilon-Montonicity for Accelerating Slowly-Convergent, Monotone
###   Fixed-Point Iterations
### Aliases: daarem
### Keywords: optimization EM algorithm

### ** Examples


n <- 2000
npars <- 25
true.beta <- .5*rt(npars, df=2) + 2
XX <- matrix(rnorm(n*npars), nrow=n, ncol=npars)
yy <- ProbitSimulate(true.beta, XX)
max.iter <- 1000
beta.init <- rep(0.0, npars)

# Estimating Probit model with DAAREM acceleration
aa.probit <- daarem(par=beta.init, fixptfn = ProbitUpdate, objfn = ProbitLogLik,
                    X=XX, y=yy, control=list(maxiter=max.iter))

plot(aa.probit$objfn, type="b", xlab="Iterations", ylab="log-likelihood")

## No test: 
# Compare with estimating Probit model using the EM algorithm

max.iter <- 25000  # need more iterations for EM convergence
beta.init <- rep(0.0, npars)

em.probit <- fpiter(par=beta.init, fixptfn = ProbitUpdate, objfn = ProbitLogLik,
                    X=XX, y=yy, control=list(maxiter=max.iter))
c(aa.probit$fpevals, em.probit$fpevals)
c(aa.probit$value, em.probit$value)
## End(No test)

# Accelerating using SQUAREM if the SQUAREM package is loaded
# library(SQUAREM)
# max.iter <- 5000
# sq.probit <- squarem(par=beta.init, fixptfn = ProbitUpdate, objfn = ProbitLogLik,
#                     X=XX, y=yy, control=list(maxiter=max.iter))

# print( c(aa.probit$fpevals, em.probit$fpevals, sq.probit$fpevals) )
# print( c(aa.probit$value, em.probit$value, sq.probit$value) )
# print( c(aa.probit$objfeval, em.probit$objfeval, sq.probit$objfeval) )




