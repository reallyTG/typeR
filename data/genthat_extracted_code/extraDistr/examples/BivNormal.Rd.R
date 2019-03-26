library(extraDistr)


### Name: BivNormal
### Title: Bivariate normal distribution
### Aliases: BivNormal dbvnorm rbvnorm
### Keywords: distribution

### ** Examples


y <- x <- seq(-4, 4, by = 0.25)
z <- outer(x, y, function(x, y) dbvnorm(x, y, cor = -0.75))
persp(x, y, z)

y <- x <- seq(-4, 4, by = 0.25)
z <- outer(x, y, function(x, y) dbvnorm(x, y, cor = -0.25))
persp(x, y, z)




