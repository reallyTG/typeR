library(extraDistr)


### Name: DiscreteWeibull
### Title: Discrete Weibull distribution (type I)
### Aliases: DiscreteWeibull ddweibull pdweibull qdweibull rdweibull
### Keywords: distribution

### ** Examples


x <- rdweibull(1e5, 0.32, 1)
xx <- seq(-2, 100, by = 1)
plot(prop.table(table(x)), type = "h")
lines(xx, ddweibull(xx, .32, 1), col = "red")

# Notice: distribution of F(X) is far from uniform:
hist(pdweibull(x, .32, 1), 50)

plot(ecdf(x))
lines(xx, pdweibull(xx, .32, 1), col = "red", lwd = 2, type = "s")




