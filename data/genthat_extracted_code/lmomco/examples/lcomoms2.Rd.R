library(lmomco)


### Name: lcomoms2
### Title: The Sample L-comoments for Two Variables
### Aliases: lcomoms2
### Keywords: multivariate L-comoment

### ** Examples

## Not run: 
##D # Random simulation of standard normal and then combine with
##D # a random standard exponential distribution
##D X <- rnorm(200); Y <- X + rexp(200)
##D z <- lcomoms2(data.frame(X=X, Y=Y))
##D print(z)
##D 
##D z <- lcomoms2(data.frame(X=X, Y=Y), diag=TRUE)
##D print(z$T3) # the L-skew values of the margins
##D 
##D z <- lcomoms2(data.frame(X=X, Y=Y), opdiag=TRUE)
##D print(z$T3) # the L-coskew values
## End(Not run)



