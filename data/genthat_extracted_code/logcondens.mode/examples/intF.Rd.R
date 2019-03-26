library(logcondens.mode)


### Name: intF
### Title: Computes the Integral of the estimated CDF at Arbitrary Real
###   Numbers in s
### Aliases: intF
### Keywords: htest nonparametric

### ** Examples

## estimate gamma density
set.seed(1977)
x <- sort(rgamma(200, 2, 1))
res <- activeSetLogCon(x, w = NA, print = FALSE)

## compute and plot the process D(t) in Duembgen and Rufibach (2009)
s <- seq(min(x), max(x), by = 10 ^ -3)
D1 <- intF(s, x, res$phi, res$Fhat)
D2 <- intECDF(s, x)
par(mfrow = c(2, 1))
plot(x, res$phi, type = 'l'); rug(x)
plot(s, D1 - D2, type = 'l'); abline(h = 0, lty = 2)



