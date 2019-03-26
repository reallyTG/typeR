library(Compositional)


### Name: Simulation of compositional data from Gaussian mixture models
### Title: Simulation of compositional data from Gaussian mixture models
### Aliases: rmixcomp
### Keywords: random vectors simulation Gaussian mixture models

### ** Examples

p <- c(1/3, 1/3, 1/3)
mu <- matrix(nrow = 3, ncol = 4)
s <- array( dim = c(4, 4, 3) )
x <- as.matrix(iris[, 1:4])
ina <- as.numeric(iris[, 5])
mu <- rowsum(x, ina) / 50
s[, , 1] <- cov(x[ina == 1, ])
s[, , 2] <- cov(x[ina == 2, ])
s[, , 3] <- cov(x[ina == 3, ])
y <- rmixcomp(100, p, mu, s, type = "alr")



