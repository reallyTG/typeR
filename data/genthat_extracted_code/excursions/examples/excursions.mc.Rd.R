library(excursions)


### Name: excursions.mc
### Title: Excursion sets and contour credible regions using Monte Carlo
###   samples
### Aliases: excursions.mc

### ** Examples

## Create mean and a tridiagonal precision matrix
n = 101
mu.x = seq(-5, 5, length=n)
Q.x = Matrix(toeplitz(c(1, -0.1, rep(0, n-2))))
## Sample the model 100 times (increase for better estimate)
X = mu.x + solve(chol(Q.x),matrix(rnorm(n=n*1000),nrow=n,ncol=1000))
## calculate the positive excursion function
res.x = excursions.mc(X,alpha=0.05,type='>',u=0)
## Plot the excursion function and the marginal excursion probabilities
plot(res.x$F, type="l",
     main='Excursion function (black) and marginal probabilites (red)')
lines(res.x$rho, col=2)



