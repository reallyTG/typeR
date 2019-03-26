library(CoImp)


### Name: MAR
### Title: Generation of multivariate missing at random (MAR) data
### Aliases: MAR
### Keywords: imputation copula multivariate

### ** Examples


# generate data from a 4-variate Gumbel copula with different margins

set.seed(11)
n.marg <- 4
theta  <- 5
copula <- frankCopula(theta, dim = n.marg)
mymvdc <- mvdc(copula, c("norm", "gamma", "beta","gamma"), list(list(mean=7, sd=2),
list(shape=3, rate=2), list(shape1=4, shape2=1), list(shape=4, rate=3)))
n      <- 50
x.samp <- rMvdc(n, mymvdc)

# apply MAR by introducing 30% of missing data

mar    <- MAR(db.complete = x.samp, perc.miss = 0.3, setseed = 11)

mar




