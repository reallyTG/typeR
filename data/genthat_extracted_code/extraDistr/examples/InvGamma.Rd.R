library(extraDistr)


### Name: InvGamma
### Title: Inverse-gamma distribution
### Aliases: InvGamma dinvgamma pinvgamma qinvgamma rinvgamma
### Keywords: distribution

### ** Examples


x <- rinvgamma(1e5, 20, 3)
hist(x, 100, freq = FALSE)
curve(dinvgamma(x, 20, 3), 0, 1, col = "red", add = TRUE, n = 5000)
hist(pinvgamma(x, 20, 3))
plot(ecdf(x))
curve(pinvgamma(x, 20, 3), 0, 1, col = "red", lwd = 2, add = TRUE, n = 5000) 




