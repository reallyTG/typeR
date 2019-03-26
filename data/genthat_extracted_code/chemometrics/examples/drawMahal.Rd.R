library(chemometrics)


### Name: drawMahal
### Title: Draws ellipses according to Mahalanobis distances
### Aliases: drawMahal
### Keywords: multivariate robust

### ** Examples

data(glass)
data(glass.grp)
x=glass[,c(2,7)]
require(robustbase)
x.mcd=covMcd(x)
drawMahal(x,center=x.mcd$center,covariance=x.mcd$cov,quantile=0.975,pch=glass.grp)



