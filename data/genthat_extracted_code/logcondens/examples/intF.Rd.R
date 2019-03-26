library(logcondens)


### Name: intF
### Title: Computes the Integral of the estimated CDF at Arbitrary Real
###   Numbers in s
### Aliases: intF
### Keywords: htest nonparametric

### ** Examples

## estimate gamma density
set.seed(1977)
x <- rgamma(200, 2, 1)
res <- logConDens(x, smoothed = FALSE, print = FALSE)

## compute and plot the process D(t) in Duembgen and Rufibach (2009)
s <- seq(min(res$x), max(res$x), by = 10 ^ -3)
D1 <- intF(s, res)
D2 <- intECDF(s, res$xn)
par(mfrow = c(2, 1))
plot(res$x, res$phi, type = 'l'); rug(res$x)
plot(s, D1 - D2, type = 'l'); abline(h = 0, lty = 2)



