library(ThresholdROC)


### Name: thres2
### Title: Threshold point estimation and confidence intervals (two-state
###   setting)
### Aliases: thres2
### Keywords: threshold bootstrap

### ** Examples

# example 1
n1 <- 100
n2 <- 100
set.seed(1234)
par1.1 <- 0
par1.2 <- 1
par2.1 <- 2
par2.2 <- 1
rho <- 0.2
k1 <- rnorm(n1, par1.1, par1.2) # non-diseased
k2 <- rnorm(n2, par2.1, par2.2) # diseased

thres2(k1, k2, rho, method="eq", ci.method="d")
thres2(k1, k2, rho, method="uneq", ci.method="d")
## Not run: 
##D thres2(k1, k2, rho, method="empirical", ci.method="b")
##D 
##D # example 2
##D set.seed(1234)
##D k1 <- rnorm(50, 10, 3)
##D k2 <- rlnorm(55)
##D rho <- 0.3
##D thres2(k1, k2, rho, method="param", ci.method="boot", dist1="norm", dist2="lnorm")
## End(Not run)

# supress confidence intervals calculation
thres2(k1, k2, rho, method="equal", ci=FALSE)
thres2(k1, k2, rho, method="empirical", ci=FALSE)




