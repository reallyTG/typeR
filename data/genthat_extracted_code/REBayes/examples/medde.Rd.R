library(REBayes)


### Name: medde
### Title: Maximum Entropy [De]Regularized Density Estimation
### Aliases: medde
### Keywords: nonparametric

### ** Examples


## Not run: 
##D #Maximum Likelihood Estimation of a Log-Concave Density
##D set.seed(1968)
##D x <- rgamma(50,10)
##D m <- medde(x, v = 50, lambda = -.5, verb = 5)
##D plot(m, type = "l", xlab = "x", ylab = "f(x)")
##D lines(m$x,dgamma(m$x,10),col = 2)
##D title("Log-concave Constraint")
## End(Not run)

## Not run: 
##D #Maximum Likelihood Estimation of a Gamma Density with TV constraint
##D set.seed(1968)
##D x <- rgamma(50,5)
##D f <- medde(x, v = 50, lambda = 0.2, verb = 5)
##D plot(f, type = "l", xlab = "x", ylab = "f(x)")
##D lines(f$x,dgamma(f$x,5),col = 2)
##D legend(10,.15,c("ghat","true"),lty = 1, col = 1:2)
##D title("Total Variation Norm Constraint")
## End(Not run)




