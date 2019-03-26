library(EMMIXuskew)


### Name: dfmmst
### Title: Multivariate skew t distribution
### Aliases: dfmmst dmst
### Keywords: mixture density multivariate skew t multivariate distribution

### ** Examples
           
dmst(c(1,2), mu=c(1,5), sigma=diag(2), delta=c(-3,1), dof=4)
obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$delta <- list(c(3,1.5), c(5,10), c(2,0))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)     
dfmmst(matrix(c(1,2,5,6,2,4),3,2), obj$mu, obj$sigma, obj$delta, 
    obj$dof, obj$pro)
dfmmst(c(1,2), known=obj)




