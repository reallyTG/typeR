library(extraDistr)


### Name: DiscreteLaplace
### Title: Discrete Laplace distribution
### Aliases: DiscreteLaplace ddlaplace pdlaplace rdlaplace
### Keywords: distribution

### ** Examples


p <- 0.45
x <- rdlaplace(1e5, 0, p)
xx <- seq(-200, 200, by = 1)
plot(prop.table(table(x)))
lines(xx, ddlaplace(xx, 0, p), col = "red")
hist(pdlaplace(x, 0, p))
plot(ecdf(x))
lines(xx, pdlaplace(xx, 0, p), col = "red", type = "s")




