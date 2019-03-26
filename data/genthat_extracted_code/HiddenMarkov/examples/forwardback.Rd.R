library(HiddenMarkov)


### Name: forwardback
### Title: Forward and Backward Probabilities of DTHMM
### Aliases: forwardback forward backward forwardback.dthmm
### Keywords: distribution

### ** Examples

#    Set Parameter Values

Pi <- matrix(c(1/2, 1/2,   0,   0,   0,
               1/3, 1/3, 1/3,   0,   0,
                 0, 1/3, 1/3, 1/3,   0,
                 0,   0, 1/3, 1/3, 1/3,
                 0,   0,   0, 1/2, 1/2),
             byrow=TRUE, nrow=5)

p <- c(1, 4, 2, 5, 3)
delta <- c(0, 1, 0, 0, 0)

#------   Poisson HMM   ------

x <- dthmm(NULL, Pi, delta, "pois", list(lambda=p), discrete=TRUE)

x <- simulate(x, nsim=10)

y <- forwardback(x$x, Pi, delta, "pois", list(lambda=p))

# below should be same as LL for all time points
print(log(diag(exp(y$logalpha) %*% t(exp(y$logbeta)))))
print(y$LL)

#------   Gaussian HMM   ------

x <- dthmm(NULL, Pi, delta, "norm", list(mean=p, sd=p/3))

x <- simulate(x, nsim=10)

y <- forwardback(x$x, Pi, delta, "norm", list(mean=p, sd=p/3))

# below should be same as LL for all time points
print(log(diag(exp(y$logalpha) %*% t(exp(y$logbeta)))))
print(y$LL)



