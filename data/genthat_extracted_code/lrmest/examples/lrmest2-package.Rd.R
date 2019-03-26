library(lrmest)


### Name: lrmest-package
### Title: Estimation of varies types of estimators in the linear model
### Aliases: lrmest-package lrmest
### Keywords: package

### ** Examples

## Portland cement dataset is used.
data(pcd)
attach(pcd)
k<-c(0:3/10)
d<-c(-3:3/10)
r<-c(2.1930,1.1533,0.75850)
R<-c(1,0,0,0,0,1,0,0,0,0,1,0)
dpn<-c(0.0439,0.0029,0.0325)
delt<-c(0,0,0)
aa1<-c(0.958451,1.021155,0.857821,1.040296)
aa2<-c(0.345454,1.387888,0.866466,1.354454)
aa3<-c(0.344841,1.344723,0.318451,1.523316)
optimum(Y~X1+X2+X3+X4-1,r,R,dpn,delt,aa1,aa2,aa3,k,d,data=pcd)   
 # Model without the intercept is considered.
 ## Use "press=TRUE" to get the optimum PRESS values only for some of 
# the estimators.



