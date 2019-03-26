library(extraDistr)


### Name: PoissonMix
### Title: Mixture of Poisson distributions
### Aliases: PoissonMix dmixpois pmixpois rmixpois
### Keywords: distribution

### ** Examples


x <- rmixpois(1e5, c(5, 12, 19), c(1/3, 1/3, 1/3))
xx <- seq(-1, 50)
plot(prop.table(table(x)))
lines(xx, dmixpois(xx, c(5, 12, 19), c(1/3, 1/3, 1/3)), col = "red")
hist(pmixpois(x, c(5, 12, 19), c(1/3, 1/3, 1/3)))

xx <- seq(0, 50, by = 0.01)
plot(ecdf(x))
lines(xx, pmixpois(xx, c(5, 12, 19), c(1/3, 1/3, 1/3)), col = "red", lwd = 2)




