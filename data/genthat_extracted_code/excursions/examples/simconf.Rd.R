library(excursions)


### Name: simconf
### Title: Simultaneous confidence regions for Gaussian models
### Aliases: simconf

### ** Examples

## Create mean and a tridiagonal precision matrix
n = 11
mu.x = seq(-5, 5, length=n)
Q.x = Matrix(toeplitz(c(1, -0.1, rep(0, n-2))))
## calculate the confidence region
conf = simconf(0.05, mu.x, Q.x, max.threads=2)
## Plot the region
plot(mu.x, type="l", ylim=c(-10, 10),
     main='Mean (black) and confidence region (red)')
lines(conf$a, col=2)
lines(conf$b, col=2)



