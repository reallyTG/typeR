library(flood)


### Name: RegioHill
### Title: Regional EVI estimator
### Aliases: RegioHill

### ** Examples

library("evd")
x1 <- rgev(150, loc = 2, scale = 1, shape=0.4)
hill(x1, k=20)
x2 <- rgev(100, loc = 2.5, scale = 1, shape=0.4)
x2 <- c(x2, rep(NA, 50))
x <- cbind(x1, x2)
k <- c(40, 30)
RegioHill(x, k)



