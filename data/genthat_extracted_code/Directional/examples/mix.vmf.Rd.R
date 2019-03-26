library(Directional)


### Name: Mixtures of Von Mises-Fisher distributions
### Title: Mixtures of Von Mises-Fisher distributions
### Aliases: mix.vmf
### Keywords: Model based clustering von Mises-Fisher distribution

### ** Examples

k <- runif(4, 4, 20)
prob <- c(0.2, 0.4, 0.3, 0.1)
mu <- matrix(rnorm(16), ncol = 4)
mu <- mu / sqrt( rowSums(mu^2) )
x <- rmixvmf(200, prob, mu, k)$x
mix.vmf(x, 3)
mix.vmf(x, 4)
mix.vmf(x, 5)



