library(excursions)


### Name: simconf.mc
### Title: Simultaneous confidence regions using Monte Carlo samples
### Aliases: simconf.mc

### ** Examples

## Create mean and a tridiagonal precision matrix
n = 11
mu.x = seq(-5, 5, length=n)
Q.x = Matrix(toeplitz(c(1, -0.1, rep(0, n-2))))
## Sample the model 100 times (increase for better estimate)
X = mu.x + solve(chol(Q.x),matrix(rnorm(n=n*100),nrow=n,ncol=100))
## calculate the confidence region
conf = simconf.mc(X,0.2)
## Plot the region
plot(mu.x, type="l", ylim=c(-10, 10),
     main='Mean (black) and confidence region (red)')
lines(conf$a, col=2)
lines(conf$b, col=2)



