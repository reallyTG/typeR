library(kdecopula)


### Name: kdecopula
### Title: Kernel Smoothing for Bivariate Copula Densities
### Aliases: kdecopula kdecopula-package kdecopula-package
### Keywords: package

### ** Examples


## load data and transform with empirical cdf
data(wdbc)
udat <- apply(wdbc[, -1], 2, function(x) rank(x)/(length(x)+1))

## estimation of copula density of variables 5 and 6
dens.est <- kdecop(udat[, 5:6])
plot(dens.est)

## evaluate density estimate at (u1,u2)=(0.123,0.321)
dkdecop(c(0.123, 0.321), dens.est)

## evaluate cdf estimate at (u1,u2)=(0.123,0.321)
pkdecop(c(0.123, 0.321), dens.est)

## simulate 500 samples from density estimate
rkdecop(500, dens.est)




