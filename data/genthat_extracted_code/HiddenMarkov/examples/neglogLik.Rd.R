library(HiddenMarkov)


### Name: neglogLik
### Title: Negative Log-Likelihood
### Aliases: neglogLik
### Keywords: optimize

### ** Examples

#   Example where the Markov chain is assumed to be stationary

Pi <- matrix(c(0.8, 0.1, 0.1,
               0.1, 0.6, 0.3,
               0.2, 0.3, 0.5),
             byrow=TRUE, nrow=3)

#   start simulation in state 2
delta <- c(0, 1, 0)

x <- dthmm(NULL, Pi, delta, "exp", list(rate=c(5, 2, 0.2)), nonstat=FALSE)
x <- simulate(x, nsim=5000, seed=5)

#   Approximate solution using BaumWelch
x1 <- BaumWelch(x, control=bwcontrol(maxiter=10, tol=1e-5))


#   Exact solution using nlm

allmap <- function(y, p){
    #    maps vector back to delta, Pi and rate
    m <- sqrt(length(p))
    y$Pi <- vector2Pi(p[1:(m*(m-1))])
    y$pm$rate <- exp(p[(m^2-m+1):(m^2)])
    y$delta <- compdelta(Pi)
    return(y)
}

p <- c(Pi2vector(x$Pi), log(x$pm$rate))
#   Increase iterlim below to achieve convergence
#   Has been restricted to minimise time of package checks
z <- nlm(neglogLik, p, object=x, pmap=allmap,
         print.level=2, gradtol=0.000001, iterlim=2)
x2 <- allmap(x, z$estimate)


#   compare parameter estimates
print(summary(x))
print(summary(x1))
print(summary(x2))


#--------------------------------------------------------
#   Estimate only the off diagonal elements in the matrix Pi
#   Hold all others as in the simulation

#   This function maps the changeable parameters into the
#   dthmm object - done within the function neglogLik
#   The logit-like transform removes boundaries

Pi <- matrix(c(0.8, 0.1, 0.1,
               0.1, 0.6, 0.3,
               0.2, 0.3, 0.5),
             byrow=TRUE, nrow=3)

delta <- c(0, 1, 0)

x <- dthmm(NULL, Pi, delta, "exp", list(rate=c(5, 3, 1)))
x <- simulate(x, nsim=5000, seed=5)

offdiagmap <- function(y, p){
    #   rows must sum to one
    invlogit <- function(eta)
        exp(eta)/(1+exp(eta))
    y$Pi[1,2] <- (1-y$Pi[1,1])*invlogit(p[1])
    y$Pi[1,3] <- 1-y$Pi[1,1]-y$Pi[1,2]
    y$Pi[2,1] <- (1-y$Pi[2,2])*invlogit(p[2])
    y$Pi[2,3] <- 1-y$Pi[2,1]-y$Pi[2,2]
    y$Pi[3,1] <- (1-y$Pi[3,3])*invlogit(p[3])
    y$Pi[3,2] <- 1-y$Pi[3,1]-y$Pi[3,3]
    return(y)
}

z <- nlm(neglogLik, c(0, 0, 0), object=x, pmap=offdiagmap,
         print.level=2, gradtol=0.000001)

#    x1 contains revised parameter estimates
x1 <- offdiagmap(x, z$estimate)

#    print revised values of Pi
print(x1$Pi)

#    print log-likelihood using original and revised values
print(logLik(x))
print(logLik(x1))

#--------------------------------------------------------
#   Fully estimate both Q and lambda for an MMPP Process

Q <- matrix(c(-8,  5,  3,
               1, -4,  3,
               2,  5, -7),
            byrow=TRUE, nrow=3)/25
lambda <- c(5, 3, 1)
delta <- c(0, 1, 0)

#    simulate some data
x <- mmpp(NULL, Q, delta, lambda)
x <- simulate(x, nsim=5000, seed=5)

allmap <- function(y, p){
    #    maps vector back to Pi and rate
    m <- sqrt(length(p))
    y$Q <- vector2Q(p[1:(m*(m-1))])
    y$lambda <- exp(p[(m^2-m+1):(m^2)])
    return(y)
}

#    Start by using the EM algorithm
x1 <- BaumWelch(x, control=bwcontrol(maxiter=10, tol=0.01))

#    use above as initial values for the nlm function
#    map parameters to a single vector, fixed delta
p <- c(Q2vector(x1$Q), log(x1$lambda))

#    Complete estimation using nlm
#    Increase iterlim below to achieve convergence
#    Has been restricted to minimise time of package checks
z <- nlm(neglogLik, p, object=x, pmap=allmap,
         print.level=2, gradtol=0.000001, iterlim=5)

#    mmpp object with estimated parameter values from nlm
x2 <- allmap(x, z$estimate)

#    compare log-likelihoods
print(logLik(x))
print(logLik(x1))
print(logLik(x2))

#   print final parameter estimates
print(summary(x2))



