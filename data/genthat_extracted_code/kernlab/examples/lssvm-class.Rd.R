library(kernlab)


### Name: lssvm-class
### Title: Class "lssvm"
### Aliases: lssvm-class alpha,lssvm-method b,lssvm-method
###   cross,lssvm-method error,lssvm-method kcall,lssvm-method
###   kernelf,lssvm-method kpar,lssvm-method param,lssvm-method
###   lev,lssvm-method type,lssvm-method alphaindex,lssvm-method
###   xmatrix,lssvm-method ymatrix,lssvm-method scaling,lssvm-method
###   nSV,lssvm-method
### Keywords: classes

### ** Examples


# train model
data(iris)
test <- lssvm(Species~.,data=iris,var=2)
test
alpha(test)
error(test)
lev(test)



