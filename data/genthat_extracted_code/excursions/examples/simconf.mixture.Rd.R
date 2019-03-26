library(excursions)


### Name: simconf.mixture
### Title: Simultaneous confidence regions for Gaussian mixture models
### Aliases: simconf.mixture

### ** Examples

n = 11
K = 3
mu <- Q <- list()
for(k in 1:K){
  mu[[k]] = k*0.1 + seq(-5, 5, length=n)
  Q[[k]] = Matrix(toeplitz(c(1, -0.1, rep(0, n-2))))
}
## calculate the confidence region
conf = simconf.mixture(0.05, mu, Q, w = rep(1/3,3), max.threads=2)

## Plot the region
plot(mu[[1]],type="l")
lines(mu[[2]])
lines(mu[[3]])
lines(conf$a, col=2)
lines(conf$b, col=2)



