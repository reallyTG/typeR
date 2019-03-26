library(lrmest)


### Name: ogols
### Title: Ordinary Generalized Ordinary Least Square Estimators
### Aliases: ogols
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Portland cement data set is used.
data(pcd)
ogols(Y~X1+X2+X3+X4-1,data=pcd)     
# Model without the intercept is considered.



