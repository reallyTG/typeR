library(extraDistr)


### Name: GammaPoiss
### Title: Gamma-Poisson distribution
### Aliases: GammaPoiss dgpois pgpois rgpois
### Keywords: distribution

### ** Examples


x <- rgpois(1e5, 7, 0.002)
xx <- seq(0, 12000, by = 1)
hist(x, 100, freq = FALSE)
lines(xx, dgpois(xx, 7, 0.002), col = "red")
hist(pgpois(x, 7, 0.002))
xx <- seq(0, 12000, by = 0.1)
plot(ecdf(x))
lines(xx, pgpois(xx, 7, 0.002), col = "red", lwd = 2)




