library(kernlab)


### Name: gausspr-class
### Title: Class "gausspr"
### Aliases: gausspr-class alpha,gausspr-method cross,gausspr-method
###   error,gausspr-method kcall,gausspr-method kernelf,gausspr-method
###   kpar,gausspr-method lev,gausspr-method type,gausspr-method
###   alphaindex,gausspr-method xmatrix,gausspr-method
###   ymatrix,gausspr-method scaling,gausspr-method
### Keywords: classes

### ** Examples


# train model
data(iris)
test <- gausspr(Species~.,data=iris,var=2)
test
alpha(test)
error(test)
lev(test)



