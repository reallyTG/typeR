library(lrmest)


### Name: ols
### Title: Ordinary Least Square Estimators
### Aliases: ols
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Portland cement data set is used.
data(pcd)
ols(Y~X1+X2+X3+X4-1,data=pcd)    # Model without the intercept is considered.



