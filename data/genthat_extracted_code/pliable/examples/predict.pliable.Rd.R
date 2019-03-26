library(pliable)


### Name: predict.pliable
### Title: Compute predicted values from a fitted pliable object Make
###   predictions from a fitted pliable lasso model
### Aliases: predict.pliable

### ** Examples

# Train a pliable lasso model
n = 20; p = 3 ;nz=3
x = matrix(rnorm(n*p), n, p)
z =matrix(rnorm(n*nz),n,nz)
y = x[,1] +x[,1]*z[,3]+ rnorm(n)
  fit = pliable(x,z,y)
 # plot coefficient profiles, indicating z-interactions with a "x" symbol
plot(fit)


# Predict using the fitted model
ntest=500
xtest = matrix(rnorm(ntest*p),ntest,p)
ztest =matrix(rnorm(ntest*nz),ntest,nz)

pred= predict(fit,xtest,ztest)

 #Example where z is not observed in the test set,  but predicted from a  supervised
  #  learning method

 library(glmnet)
n = 20; p = 3 ;nz=3
x = matrix(rnorm(n*p), n, p)
z =matrix(rnorm(n*nz),n,nz)
y = x[,1] +x[,1]*z[,3]+ rnorm(n)
fit = pliable(x,z,y)
# predict z  from x; here we use glmnet, but any other supervised learning method
# could be used
zfit=glmnet(x,z,family="mgaussian")

# Predict using the fitted model
ntest=500
xtest = matrix(rnorm(ntest*p),ntest,p)
ztest =predict(zfit,xtest,s=zfit$lambda.min)[,,20]

pred= predict(fit,xtest,ztest)




