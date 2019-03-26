library(excursions)


### Name: excursions-package
### Title: Excursion Sets and Contour Credibility Regions for Random Fields
### Aliases: excursions-package excursions

### ** Examples

## Create a tridiagonal precision matrix
n = 21
Q.x = sparseMatrix(i=c(1:n, 2:n), j=c(1:n, 1:(n-1)), x=c(rep(1, n), rep(-0.1, n-1)),
                   dims=c(n, n), symmetric=TRUE)
## Set the mean value function
mu.x = seq(-5, 5, length=n)

## calculate the level 0 positive excursion function
res.x = excursions(alpha=1, u=0, mu=mu.x, Q=Q.x, 
                   type='>', verbose=1, max.threads=2)
                   
## Plot the excursion function and the marginal excursion probabilities
plot(res.x$F, type="l", 
     main='Excursion function (black) and marginal probabilites (red)')
lines(res.x$rho, col=2)



