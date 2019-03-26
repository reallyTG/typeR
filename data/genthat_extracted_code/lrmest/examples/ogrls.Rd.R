library(lrmest)


### Name: ogrls
### Title: Ordinary Generalized Restricted Least Square Estimator
### Aliases: ogrls
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Portland cement data set is used.
data(pcd)
r<-c(2.1930,1.1533,0.75850)
R<-c(1,0,0,0,0,1,0,0,0,0,1,0)
delt<-c(0,0,0)
ogrls(Y~X1+X2+X3+X4-1,r,R,delt,data=pcd)     
# Model without the intercept is considered.



