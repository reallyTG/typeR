library(ncg)


### Name: qgammanc
### Title: Computes the probability density function of the noncentral
###   gamma function
### Aliases: qgammanc
### Keywords: qgammanc

### ** Examples

library(ncg)
p <- c(0.80, 0.98, 0.24)
alpha <- c(1.5, 1.2, 2.1)
delta <- c(0.2, 0.3, 1.5)
qgammanc(p, alpha, delta)
# single values example
qgammanc(0.98, 1.2, 0.3)



