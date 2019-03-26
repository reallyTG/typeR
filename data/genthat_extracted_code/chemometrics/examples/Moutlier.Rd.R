library(chemometrics)


### Name: Moutlier
### Title: Plots classical and robust Mahalanobis distances
### Aliases: Moutlier
### Keywords: multivariate robust

### ** Examples

data(glass)
data(glass.grp)
x=glass[,c(2,7)]
require(robustbase)
res <- Moutlier(glass,quantile=0.975,pch=glass.grp)



