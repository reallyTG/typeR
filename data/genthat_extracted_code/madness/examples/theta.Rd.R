library(madness)


### Name: theta
### Title: Estimate the symmetric second moment array of values.
### Aliases: theta

### ** Examples

set.seed(123)
X <- matrix(rnorm(1000*3),ncol=3)
th <- theta(X)

## Not run: 
##D if (require(sandwich)) {
##D  th2 <- theta(X,vcov.func=vcovHC)
##D }
## End(Not run)
# works on data frames too:
set.seed(456)
X <- data.frame(a=runif(100),b=rnorm(100),c=1)
th <- theta(X)



