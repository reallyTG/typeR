library(Directional)


### Name: Contour plot of a mixture of von Mises-Fisher distributions model
### Title: Contour plot of a mixture of von Mises-Fisher distributions
###   model for spherical data only.
### Aliases: mixvmf.contour
### Keywords: Contour plot Mixtures of von Mises-Fisher distributions

### ** Examples

k <- runif(2, 4, 20)
prob <- c(0.4, 0.6)
mu <- matrix( rnorm(6), ncol = 3 )
mu <- mu / sqrt( rowSums(mu^2) )
x <- rmixvmf(200, prob, mu, k)$x
mod <- mix.vmf(x, 2)
y <- euclid.inv(x)
mixvmf.contour(y, mod)



