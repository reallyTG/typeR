library(lrmest)


### Name: checkm
### Title: Check the degree of multicollinearity present in the dataset
### Aliases: checkm
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Portland cement data set is used.
data(pcd)
checkm(Y~X1+X2+X3+X4,data=pcd)



