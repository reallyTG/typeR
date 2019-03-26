library(kdecopula)


### Name: kdecop
### Title: Bivariate kernel copula density estimation
### Aliases: kdecop

### ** Examples


## load data and transform with empirical cdf
data(wdbc)
udat <- apply(wdbc[, -1], 2, function(x) rank(x) / (length(x) + 1))

## estimation of copula density of variables 5 and 6
fit <- kdecop(udat[, 5:6])
summary(fit)
plot(fit)
contour(fit)

## evaluate density estimate at (u1,u2)=(0.123,0.321)
dkdecop(c(0.123, 0.321), fit)

## evaluate cdf estimate at (u1,u2)=(0.123,0.321)
pkdecop(c(0.123, 0.321), fit)

## simulate 500 samples from density estimate
plot(rkdecop(500, fit))  # pseudo-random
plot(rkdecop(500, fit, quasi = TRUE))  # quasi-random





