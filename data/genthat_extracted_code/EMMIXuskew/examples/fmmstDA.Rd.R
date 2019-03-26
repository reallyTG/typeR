library(EMMIXuskew)


### Name: fmmstDA
### Title: Discriminant analysis using Multivariate Skew t Mixture Models
### Aliases: fmmstDA

### ** Examples

obj <- list()
obj$mu <- list(c(17,19), c(5,22), c(6,10))
obj$sigma <- list(diag(2), matrix(c(2,0,0,1),2), matrix(c(3,7,7,24),2))
obj$delta <- list(c(3,1.5), c(5,10), c(2,0))
obj$dof <- c(1, 2, 3)
obj$pro <- c(0.25, 0.25, 0.5)
X2 <- rfmmst(3, 50, known=obj)
fmmstDA(3, X2[,1:2], obj)



