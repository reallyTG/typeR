library(idr)


### Name: get.pseudo.mix
### Title: Compute the pseudo values of a mixture model from the empirical
###   CDF
### Aliases: get.pseudo.mix
### Keywords: internal

### ** Examples


x <- seq(0.1, 0.9, by=0.1)

mu <- 2.6
sigma <- 1.3
rho <- 0.8
p <- 0.7

pseudo.x <- get.pseudo.mix(x, mu, sigma, rho, p)

pseudo.x



