library(orthoDr)


### Name: orthoDr_surv
### Title: IR-CP model
### Aliases: orthoDr_surv

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
forward.fit = orthoDr_surv(dataX, Y, Censor, method = "forward")
distance(failEDR, forward.fit$B, "dist")

dn.fit = orthoDr_surv(dataX, Y, Censor, method = "dn", ndr = ndr)
distance(failEDR, dn.fit$B, "dist")

dm.fit = orthoDr_surv(dataX, Y, Censor, method = "dm", ndr = ndr)
distance(failEDR, dm.fit$B, "dist")



