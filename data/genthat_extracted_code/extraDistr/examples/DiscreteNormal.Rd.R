library(extraDistr)


### Name: DiscreteNormal
### Title: Discrete normal distribution
### Aliases: DiscreteNormal ddnorm pdnorm rdnorm
### Keywords: distribution

### ** Examples


x <- rdnorm(1e5, 0, 3)
xx <- -15:15
plot(prop.table(table(x)))
lines(xx, ddnorm(xx, 0, 3), col = "red")
hist(pdnorm(x, 0, 3))
plot(ecdf(x))
xx <- seq(-15, 15, 0.1)
lines(xx, pdnorm(xx, 0, 3), col = "red", lwd = 2, type = "s")




