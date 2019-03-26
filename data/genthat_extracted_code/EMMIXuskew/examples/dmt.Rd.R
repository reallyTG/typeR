library(EMMIXuskew)


### Name: dmt
### Title: Multivariate t distribution
### Aliases: dmt pmt dfmmt
### Keywords: mixture density multivariate skew t multivariate distribution

### ** Examples

x <- seq(-2,4,length=21)
y <- 2*x+10
z <- x+cos(y)
mu <- c(1,12,2)
sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
dof <- 4
f  <- dmt(cbind(x,y,z), mu, sigma,dof)
## Not run: 
##D                       
##D p1 <- pmt(c(2,11,3), mu, sigma, dof)
##D p2 <- pmt(c(2,11,3), mu, sigma, dof, maxpts=10000, abseps=1e-8)
## End(Not run)

obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)
dfmmt(matrix(c(1,2,5,6,2,4),3,2), obj$mu, obj$sigma, obj$dof, obj$pro)
dfmmt(c(1,2), known=obj)



