library(ThresholdROC)


### Name: plotCostROC
### Title: Plot ROC curve and cost function
### Aliases: plotCostROC
### Keywords: ROC threshold

### ** Examples

## Not run: 
##D # example 1: x is an object of class 'thres2'
##D n1 <- 100
##D n2 <- 100
##D set.seed(19998)
##D par1.1 <- 0
##D par1.2 <- 1
##D par2.1 <- 2
##D par2.2 <- 1
##D rho <- 0.3
##D k1 <- rnorm(n1, par1.1, par1.2) # non-diseased
##D k2 <- rnorm(n2, par2.1, par2.2) # diseased
##D x <- thres2(k1, k2, rho, method="emp", ci.method="boot", extra=TRUE)
##D 
##D par(mfrow=c(1,2))
##D plotCostROC(x)
##D 
##D 
##D # example 2: x is an object of class 'thres3'
##D set.seed(2015)
##D n <- 100
##D k1 <- rlnorm(n)
##D k2 <- rnorm(n, 3, 1)
##D k3 <- rnorm(n, 5, 1)
##D rho <- c(1/3, 1/3, 1/3)
##D y <- thres3(k1, k2, k3, rho, B=1000, ci.method="boot", dist1="lnorm", dist2="norm", dist3="norm") 
##D 
##D par(mfrow=c(1,2))
##D plotCostROC(y)
## End(Not run)



