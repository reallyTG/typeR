library(asht)


### Name: abcnonHtest
### Title: Nonparametric ABC (Approximate Bootstrap Confidence) intervals.
### Aliases: abcnonHtest
### Keywords: htest

### ** Examples

# compute abc intervals for the mean
x <- c(2,4,12,4,6,3,5,7,6)
theta <- function(p,x) {sum(p*x)/sum(p)}
## smallest p-value is 2*minp for two-sided alternatives
abcnonHtest(x, theta, nullValue=0)  
## test null at 95% confidence limit is like just barely
## rejecting at the two-sided 5% level, so p-value is 0.05
abcnonHtest(x, theta, nullValue=4.072772)  
# compute abc intervals for the correlation
set.seed(1)
x <- matrix(rnorm(20),ncol=2)
theta <- function(p, x)
{
    x1m <- sum(p * x[, 1])/sum(p)
    x2m <- sum(p * x[, 2])/sum(p)
    num <- sum(p * (x[, 1] - x1m) * (x[, 2] - x2m))
    den <- sqrt(sum(p * (x[, 1] - x1m)^2) *
              sum(p * (x[, 2] - x2m)^2))
    return(num/den)
}
abcnonHtest(x, theta) 
## compare with 
## Not run: 
##D library(bootstrap)
##D abcnon(x, theta, alpha=c(.025,.975))$limits[,"abc"]
## End(Not run)  



