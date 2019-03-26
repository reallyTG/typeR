library(Directional)


### Name: Simulation of random values from a mixture of von Mises-Fisher distributions
### Title: Random values simulation from a mixture of von Mises-Fisher
###   distributions
### Aliases: rmixvmf
### Keywords: Random values simulation Mixtures of von Mises-Fisher
###   distributions

### ** Examples

k <- runif(4, 4, 20)
prob <- c(0.2, 0.4, 0.3, 0.1)
mu <- matrix(rnorm(16), ncol = 4)
mu <- mu / sqrt( rowSums(mu^2) )
x <- rmixvmf(200, prob, mu, k)$x
bic.mixvmf(x, 5)



