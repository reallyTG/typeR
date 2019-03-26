library(energy)


### Name: indep.test
### Title: Energy-tests of Independence
### Aliases: indep.test
### Keywords: htest multivariate nonparametric

### ** Examples

 ## independent multivariate data
 x <- matrix(rnorm(60), nrow=20, ncol=3)
 y <- matrix(rnorm(40), nrow=20, ncol=2)
 indep.test(x, y, method = "dcov", R = 99)
 indep.test(x, y, method = "mvI", R = 99)

 ## Not run: 
##D  ## dependent multivariate data
##D  if (require(MASS)) {
##D    Sigma <- matrix(c(1, .1, 0, 0 , 1, 0, 0 ,.1, 1), 3, 3)
##D    x <- mvrnorm(30, c(0, 0, 0), diag(3))
##D    y <- mvrnorm(30, c(0, 0, 0), Sigma) * x
##D    indep.test(x, y, R = 99)    #dcov method
##D    indep.test(x, y, method = "mvI", R = 99)
##D   }
##D  
## End(Not run)

 ## Not run: 
##D  ## compare the computing time
##D  x <- mvrnorm(50, c(0, 0, 0), diag(3))
##D  y <- mvrnorm(50, c(0, 0, 0), Sigma) * x
##D  set.seed(123)
##D  system.time(indep.test(x, y, method = "dcov", R = 1000))
##D  set.seed(123)
##D  system.time(indep.test(x, y, method = "mvI", R = 1000))
##D  
## End(Not run)



