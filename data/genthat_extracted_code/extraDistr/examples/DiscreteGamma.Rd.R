library(extraDistr)


### Name: DiscreteGamma
### Title: Discrete gamma distribution
### Aliases: DiscreteGamma ddgamma pdgamma rdgamma
### Keywords: distribution

### ** Examples


x <- rdgamma(1e5, 9, 1)
xx <- 0:50
plot(prop.table(table(x)))
lines(xx, ddgamma(xx, 9, 1), col = "red")
hist(pdgamma(x, 9, 1))
plot(ecdf(x))
xx <- seq(0, 50, 0.1)
lines(xx, pdgamma(xx, 9, 1), col = "red", lwd = 2, type = "s")




