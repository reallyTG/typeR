library(pracma)


### Name: fsolve
### Title: Solve System of Nonlinear Equations
### Aliases: fsolve
### Keywords: optimize

### ** Examples

## Not run: 
##D # Find a matrix X such that X * X * X = [1, 2; 3, 4]
##D   F <- function(x) {
##D     a <- matrix(c(1, 3, 2, 4), nrow = 2, ncol = 2, byrow = TRUE)
##D     X <- matrix(x,             nrow = 2, ncol = 2, byrow = TRUE)
##D     return(c(X %*% X %*% X - a))
##D   }
##D   x0 <- matrix(1, 2, 2)
##D   X  <- matrix(fsolve(F, x0)$x, 2, 2)
##D   X
##D   # -0.1291489  0.8602157
##D   #  1.2903236  1.1611747
## End(Not run)



