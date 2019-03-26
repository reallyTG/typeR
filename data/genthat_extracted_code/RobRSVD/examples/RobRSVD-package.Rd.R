library(RobRSVD)


### Name: RobRSVD-package
### Title: The Robust Regularized Singular Value Decomposition Package
### Aliases: RobRSVD-package
### Keywords: SVD Smoothing FDA GCV

### ** Examples

#generate a simulated data set, which is provided in Zhang et al (2013) AoAS paper.
u0<-log(10/9)*10^seq(0, 1, length=100)
v0<-sin(2*pi*seq(0, 1, length=100))/(1+1/pi)
s0<-773
data0<-s0*u0 %*% t(v0)
data<-data0+matrix(rnorm(10000, sd=20), nrow=100)
data[ceiling(10000*runif(50))]<-max(data0)+max(data0)*runif(50)
#the above provides random outlying cell simulation

#the svd calculation
data.svd<-RobRSVD(data, irobust=FALSE, uspar=0, vspar=0)

#the robsvd calculation
data.robsvd<-RobRSVD(data, irobust=TRUE, uspar=0, vspar=0)

#the ssvd calculation
data.ssvd<-RobRSVD(data, irobust=FALSE, iugcv=TRUE, ivgcv=TRUE)

#the robrsvd calculation
data.robrsvd<-RobRSVD(data, irobust=TRUE, iugcv=TRUE, ivgcv=TRUE)

#compare v's
plot(data.svd$v, type='l', ylab='V')
lines(data.robrsvd$v, col=2)
lines(data.ssvd$v, col=6)
lines(data.robsvd$v, col=4)

#compare u's
plot(data.svd$u, type='l', ylab='U')
lines(data.robrsvd$u, col=2)
lines(data.ssvd$u, col=6)
lines(data.robsvd$u, col=4)

#compare approximation matrices
#app.svd=data.svd$s * data.svd$u %*% t(data.svd$v)
#app.ssvd=data.ssvd$s * data.ssvd$u %*% t(data.ssvd$v)
#app.robsvd=data.robsvd$s * data.robsvd$u %*% t(data.robsvd$v)
#app.robrsvd=data.robrsvd$s * data.robrsvd$u %*% t(data.robrsvd$v)

#par(mfrow=c(2, 2))
#persp(app.svd, main='SVD', theta=-45, phi=40, xlab='', ylab='', zlab='')
#persp(app.ssvd, main='Regularized SVD', theta=-45, phi=40, xlab='', ylab='', zlab='');
#persp(app.robsvd, main='Robust SVD', theta=-45, phi=40, xlab='', ylab='', zlab='');
#persp(app.robrsvd, main='RobRSVD', theta=-45, phi=40, xlab='', ylab='', zlab='');
#dev.off()




