library(pliable)


### Name: pliable
### Title: Fit a pliable lasso model over a path of regularization values
### Aliases: pliable

### ** Examples

# Train a pliable lasso model- Gaussian case
#  Generate some data
set.seed(9334)
n = 20; p = 3 ;nz=3
x = matrix(rnorm(n*p), n, p)
mx=colMeans(x)
sx=sqrt(apply(x,2,var))
x=scale(x,mx,sx)
z =matrix(rnorm(n*nz),n,nz)
mz=colMeans(z)
sz=sqrt(apply(z,2,var))
z=scale(z,mz,sz)
y =4*x[,1] +5*x[,1]*z[,3]+ 3*rnorm(n)
 # Fit model
 fit = pliable(x,z,y)
 fit   #examine results
plot(fit)  #plot path

#Estimate main tuning parameter lambda by cross-validation
 #NOT RUN
 # cvfit=cv.pliable(fit,x,z,y,nfolds=5) # returns lambda.min and lambda.1se,
    #  the minimizing and 1se rules
 # plot(cvfit)

# Predict using the fitted model
#ntest=500
#xtest = matrix(rnorm(ntest*p),ntest,p)
#xtest=scale(xtest,mx,sx)
#ztest =matrix(rnorm(ntest*nz),ntest,nz)
#ztest=scale(ztest,mz,sz)
#ytest = 4*xtest[,1] +5*xtest[,1]*ztest[,3]+ 3*rnorm(ntest)
#pred= predict(fit,xtest,ztest,lambda=cvfit$lambda.min)
#plot(ytest,pred)

#Binary outcome example
n = 20 ; p = 3 ;nz=3
x = matrix(rnorm(n*p), n, p)
mx=colMeans(x)
sx=sqrt(apply(x,2,var))
x=scale(x,mx,sx)
z =matrix(rnorm(n*nz),n,nz)
mz=colMeans(z)
sz=sqrt(apply(z,2,var))
z=scale(z,mz,sz)
y =4*x[,1] +5*x[,1]*z[,3]+ 3*rnorm(n)
y=1*(y>0)
 fit = pliable(x,z,y,family="binomial")



# Example where z is not observed in the test set, but predicted
 #        from a supervised learning algorithm


n = 20; p = 3 ;nz=3
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
# ntest=100
#xtest =matrix(rnorm(ntest*nz),ntest,p)
#xtest=scale(xtest,mx,sx)
#ztest =predict(zfit,xtest,s=cvfit$lambda.min)[,,1]
#ytest = 4*xtest[,1] +5*xtest[,1]*ztest[,3]+ 3*rnorm(ntest)

#pred= predict(fit,xtest,ztest)
#plot(ytest,pred[,27])  # Just used 27th path member, for illustration; see cv.pliable for
#  details of how to cross-validate in this setting






