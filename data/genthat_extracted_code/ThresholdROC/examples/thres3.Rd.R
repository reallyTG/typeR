library(ThresholdROC)


### Name: thres3
### Title: Threshold point estimation and confidence intervals (three-state
###   setting)
### Aliases: thres3
### Keywords: threshold bootstrap

### ** Examples

set.seed(1234)
n <- 100
k1 <- rlnorm(n)
k2 <- rnorm(n, 3, 1)
k3 <- rnorm(n, 5, 1)
rho <- c(1/3, 1/3, 1/3)

# assuming trinormality
start <- c(mean(k1), mean(k3))
thres3(k1, k2, k3, rho, dist1="norm", dist2="norm", dist3="norm", start=start, ci.method="param") 

# not assuming trinormality
thres3(k1, k2, k3, rho, B=1000, ci.method="boot", dist1="lnorm", dist2="norm", dist3="norm")

# supress confidence intervals calculation
thres3(k1, k2, k3, rho, ci=FALSE, dist1="lnorm", dist2="norm", dist3="norm")



