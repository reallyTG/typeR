library(exactLoglinTest)


### Name: mcexact
### Title: Computes Monte Carlo exact P-values for general log-linear
###   models.
### Aliases: mcexact build.mcx.obj
### Keywords: htest

### ** Examples

#library(mcexact)
set.seed(1)

#importance sampling
data(residence.dat)
mcx <- mcexact(y ~ res.1985 + res.1980 + factor(sym.pair), data = residence.dat) 
summary(mcx)

#mcmc
data(pathologist.dat)
mcx <- mcexact(y ~ factor(A) + factor(B) + I(A * B),
               data = pathologist.dat,
               method = "cab",
               p = .5,
               nosim = 10 ^ 4,
               batchsize = 100)
summary(mcx)



