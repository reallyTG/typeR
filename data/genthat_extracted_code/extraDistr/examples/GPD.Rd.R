library(extraDistr)


### Name: GPD
### Title: Generalized Pareto distribution
### Aliases: GPD dgpd pgpd qgpd rgpd
### Keywords: distribution

### ** Examples


x <- rgpd(1e5, 5, 2, .1)
hist(x, 100, freq = FALSE, xlim = c(0, 50))
curve(dgpd(x, 5, 2, .1), 0, 50, col = "red", add = TRUE, n = 5000)
hist(pgpd(x, 5, 2, .1))
plot(ecdf(x))
curve(pgpd(x, 5, 2, .1), 0, 50, col = "red", lwd = 2, add = TRUE)




