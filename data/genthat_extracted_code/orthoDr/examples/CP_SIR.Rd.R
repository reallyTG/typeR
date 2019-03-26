library(orthoDr)


### Name: CP_SIR
### Title: Counting process based sliced inverse regression model
### Aliases: CP_SIR

### ** Examples

# This is setting 1 in Sun et. al. (2017) with reduced sample size
library(MASS)
set.seed(1)
N = 200; P = 6
V=0.5^abs(outer(1:P, 1:P, "-"))
dataX = as.matrix(mvrnorm(N, mu=rep(0,P), Sigma=V))
failEDR = as.matrix(c(1, 0.5, 0, 0, 0, rep(0, P-5)))
censorEDR = as.matrix(c(0, 0, 0, 1, 1, rep(0, P-5)))
T = rexp(N, exp(dataX %*% failEDR))
C = rexp(N, exp(dataX %*% censorEDR - 1))
ndr = 1
Y = pmin(T, C)
Censor = (T < C)

# fit the model
cpsir.fit = CP_SIR(dataX, Y, Censor)
distance(failEDR, cpsir.fit$vectors[, 1:ndr, drop = FALSE], "dist")



