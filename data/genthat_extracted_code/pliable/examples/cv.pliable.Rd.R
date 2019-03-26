library(pliable)


### Name: cv.pliable
### Title: Carries out cross-validation for a pliable lasso model over a
###   path of regularization values
### Aliases: cv.pliable

### ** Examples

## No test: 
# Train and cross-validate a pliable lasso model- Gaussian case
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
fit = pliable(x,z,y)

cvfit=cv.pliable(fit,x,z,y,nfolds=5)
  plot(cvfit)

# Example of categorical z with 4 levels
n = 20; p = 3 ;nz=3
x = matrix(rnorm(n*p), n, p)
 mx=colMeans(x)
sx=sqrt(apply(x,2,var))
x=scale(x,mx,sx)
z =sample(1:4,size=n,replace=T)
zi=model.matrix(~as.factor(z)-1)
y = x[,1] +x[,1]*zi[,3]-2*x[,1]*zi[,4]+rnorm(n)
fit = pliable(x,zi,y)

# Train and cross-validate a pliable lasso model- Binomial case
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
y= 1*(y>0)
fit = pliable(x,z,y)

cvfit=cv.pliable(fit,x,z,y,type.measure="class", nfolds=5)
  plot(cvfit)


 # Example where z is not observed in the test set,
   #   but predicted from a supervised learning algorithm
# NOT RUN

#library(glmnet)
# n = 20 ; p = 4 ;nz=3
# x = matrix(rnorm(n*p), n, p)
# mx=colMeans(x)
# sx=sqrt(apply(x,2,var))
# x=scale(x,mx,sx)
# z =matrix(rnorm(n*nz),n,nz)
# mz=colMeans(z)
# sz=sqrt(apply(z,2,var))
# z=scale(z,mz,sz)
#y =4*x[,1] +5*x[,1]*z[,3]+ 3*rnorm(n)
#fit = pliable(x,z,y)

 #nfolds=5
#  set.seed(3321)
#foldid = sample(rep(seq(nfolds), length = n))

# predict z  from x; here we use glmnet, but any other supervised learning procedure
  #  could be used
#zhat=matrix(NA,n,ncol(z))
#for(ii in 1:nfolds){
#  zfit=cv.glmnet(x[foldid!=ii,],z[foldid!=ii,],family="mgaussian")
#  zhat[foldid==ii,]=predict(zfit,x[foldid==ii,],s=zfit$lambda.min)
#}

#NOTE that the same foldid vector must be passed to cv.pliable
#cvfit=cv.pliable(fit,x,zhat,y,foldid=foldid)
#plot(cvfit)
#
## End(No test)




