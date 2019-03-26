library(nsROC)


### Name: compareROCdep
### Title: Comparison of k paired ROC curves
### Aliases: compareROCdep compareROCdep.default
### Keywords: comparison

### ** Examples

n0 <- 45; n1 <- 60
set.seed(123)
D <- c(rep(0,n0), rep(1,n1))

library(mvtnorm)
rho.12 <- 1/4; rho.13 <- 1/4; rho.23 <- 0.5
sd.controls <- c(1,1,1)
sd.cases <- c(1,1,1)
var.controls <- sd.controls%*%t(sd.controls)
var.cases <- sd.cases%*%t(sd.cases)
sigma.controls <- var.controls*matrix(c(1,rho.12,rho.13,rho.12,1,rho.23,rho.13,rho.23,1),3,3)
sigma.cases <- var.cases*matrix(c(1,rho.12,rho.13,rho.12,1,rho.23,rho.13,rho.23,1),3,3)
controls <- rmvnorm(n0, mean=rep(0,3), sigma=sigma.controls)
cases <- rmvnorm(n1, mean=rep(1.19,3), sigma=sigma.cases)
marker.samples <- rbind(controls,cases)

## No test: 
# Default method: KS statistic proposed in Martinez-Camblor by general bootstrap
output <- compareROCdep(marker.samples, D)

# L1 statistic proposed in Martinez-Camblor by general bootstrap
output1 <- compareROCdep(marker.samples, D, statistic="L1")

# CR statistic proposed in Martinez-Camblor by permutation method
output2 <- compareROCdep(marker.samples, D, method="permutation", statistic="CR")

# Venkatraman statistic
output3 <- compareROCdep(marker.samples, D, statistic="VK")

# DeLong AUC comparison methodology
output4 <- compareROCdep(marker.samples, D, method="auc")
## End(No test)



