library(ThresholdROC)


### Name: secondDer3
### Title: Second partial derivative of the cost function (three-state
###   setting)
### Aliases: secondDer3
### Keywords: derivative threshold

### ** Examples

## Not run: 
##D set.seed(1234)
##D n <- 100
##D k1 <- rlnorm(n)
##D k2 <- rnorm(n, 3, 1)
##D k3 <- rnorm(n, 5, 1)
##D rho <- c(1/3, 1/3, 1/3)
##D start <- c(mean(k1), mean(k3))
##D x <- thres3(k1, k2, k3, rho, dist1="norm", dist2="norm",
##D             dist3="norm", start=start, ci.method="param") 
##D 
##D secondDer3(x)
## End(Not run)



