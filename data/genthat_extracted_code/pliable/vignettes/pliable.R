## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE----------------------------------------------------------
#  install.packages("pliable")

## ------------------------------------------------------------------------
library(pliable)

## ------------------------------------------------------------------------
set.seed(944)
n = 50; p = 10 ;nz=5
x = matrix(rnorm(n*p), n, p)
mx=colMeans(x)
sx=sqrt(apply(x,2,var))
x=scale(x,mx,sx) 
z =matrix(rnorm(n*nz),n,nz)
mz=colMeans(z)
sz=sqrt(apply(z,2,var))
z=scale(z,mz,sz)
y =4*x[,1] +5*x[,1]*z[,3]+ 3*rnorm(n)

## ----results="hide"------------------------------------------------------
fit <- pliable(x,z,y)

## ------------------------------------------------------------------------

fit


## ------------------------------------------------------------------------
plot(fit)

## ------------------------------------------------------------------------
# get predictions for 20th model
predict(fit, x[1:5, ],z[1:5,])[,20]

## ----results="hide"------------------------------------------------------
cvfit <- cv.pliable(fit,x, z, y)

## ----results="hide"------------------------------------------------------
cvfit <- cv.pliable(fit, x, z,y , nfolds = 5)

## ----results="hide"------------------------------------------------------
foldid <- sample(rep(seq(5), length = n))
cvfit <- cv.pliable(fit, x,z,y, foldid = foldid)

## ----fig.width=5, fig.height=4-------------------------------------------
plot(cvfit)

## ------------------------------------------------------------------------
cvfit$lambda.min
cvfit$lambda.1se

## ------------------------------------------------------------------------
set.seed(44)
ntest=500
xtest = matrix(rnorm(ntest*p),ntest,p)
xtest=scale(xtest,mx,sx) 
ztest =matrix(rnorm(ntest*nz),ntest,nz)
ztest=scale(ztest,mz,sz) 
ytest = 4*xtest[,1] +5*xtest[,1]*ztest[,3]+ 3*rnorm(ntest)
pred= predict(fit,xtest,ztest,lambda=cvfit$lambda.min)
plot(ytest,pred)


## ------------------------------------------------------------------------
 n = 50; p = 10 ;nz=5
 x = matrix(rnorm(n*p), n, p)
 mx=colMeans(x)

 sx=sqrt(apply(x,2,var))
 x=scale(x,mx,sx) 
 z =matrix(rnorm(n*nz),n,nz)
 mz=colMeans(z)
 sz=sqrt(apply(z,2,var))
 z=scale(z,mz,sz)
 y =4*x[,1] +5*x[,1]*z[,3]+ 3*rnorm(n)
 
 fit = pliable(x,z,y)
 # predict z  from x; here we use glmnet, but any other supervised method can be used
 
 zfit=cv.glmnet(x,z,family="mgaussian")
 
 # Predict using the fitted model
 ntest=500
 xtest =matrix(rnorm(ntest*nz),ntest,p)
 xtest=scale(xtest,mx,sx) 
 ztest =predict(zfit,xtest,s=cvfit$lambda.min)[,,1]
 ytest = 4*xtest[,1] +5*xtest[,1]*ztest[,3]+ 3*rnorm(ntest)
 
 pred= predict(fit,xtest,ztest)

