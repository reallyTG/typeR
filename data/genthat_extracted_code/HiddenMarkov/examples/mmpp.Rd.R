library(HiddenMarkov)


### Name: mmpp
### Title: Markov Modulated Poisson Process Object
### Aliases: mmpp
### Keywords: classes

### ** Examples

Q <- matrix(c(-2,  2,
               1, -1),
            byrow=TRUE, nrow=2)/10

#    NULL indicates that we have no data at this point
x <- mmpp(NULL, Q, delta=c(0, 1), lambda=c(5, 1))

x <- simulate(x, nsim=5000, seed=5)

y <- BaumWelch(x)

print(summary(y))

#    log-likelihood using initial parameter values
print(logLik(x))

#    log-likelihood using estimated parameter values
print(logLik(y))



