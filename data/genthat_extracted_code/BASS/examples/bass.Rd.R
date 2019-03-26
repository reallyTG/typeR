library(BASS)


### Name: bass
### Title: Bayesian Adaptive Spline Surfaces (BASS)
### Aliases: bass
### Keywords: analysis data functional nonparametric regression, splines,

### ** Examples

## Not run: 
##D ####################################################################################################
##D ### univariate example
##D ####################################################################################################
##D ## simulate data (Friedman function)
##D f<-function(x){
##D   10*sin(pi*x[,1]*x[,2])+20*(x[,3]-.5)^2+10*x[,4]+5*x[,5]
##D }
##D sigma<-1 # noise sd
##D n<-500 # number of observations
##D x<-matrix(runif(n*10),n,10) #10 variables, only first 5 matter
##D y<-rnorm(n,f(x),sigma)
##D 
##D ## fit BASS, no tempering
##D mod<-bass(x,y)
##D plot(mod)
##D ## fit BASS, tempering
##D mod<-bass(x,y,temp.ladder=1.3^(0:8),start.temper=1000)
##D plot(mod)
##D 
##D ## prediction
##D npred<-1000
##D xpred<-matrix(runif(npred*10),npred,10)
##D pred<-predict(mod,xpred,verbose=TRUE) # posterior predictive samples
##D true.y<-f(xpred)
##D plot(true.y,colMeans(pred),xlab='true values',ylab='posterior predictive means')
##D abline(a=0,b=1,col=2)
##D 
##D ## sensitivity
##D sens<-sobol(mod)
##D plot(sens,cex.axis=.5)
##D 
##D ####################################################################################################
##D ### functional example
##D ####################################################################################################
##D ## simulate data (Friedman function with first variable as functional)
##D sigma<-1 # noise sd
##D n<-500 # number of observations
##D nfunc<-50 # size of functional variable grid
##D xfunc<-seq(0,1,length.out=nfunc) # functional grid
##D x<-matrix(runif(n*9),n,9) # 9 non-functional variables, only first 4 matter
##D X<-cbind(rep(xfunc,each=n),kronecker(rep(1,nfunc),x)) # to get y
##D y<-matrix(f(X),nrow=n)+rnorm(n*nfunc,0,sigma)
##D 
##D ## fit BASS
##D mod<-bass(x,y,xx.func=xfunc)
##D plot(mod)
##D 
##D ## prediction
##D npred<-100
##D xpred<-matrix(runif(npred*9),npred,9)
##D Xpred<-cbind(rep(xfunc,each=npred),kronecker(rep(1,nfunc),xpred))
##D ypred<-matrix(f(Xpred),nrow=npred)
##D pred<-predict(mod,xpred) # posterior predictive samples (each is a curve)
##D matplot(ypred,apply(pred,2:3,mean),type='l',xlab='observed',ylab='mean prediction')
##D abline(a=0,b=1,col=2)
##D matplot(t(ypred),type='l') # actual
##D matplot(t(apply(pred,2:3,mean)),type='l') # mean prediction
##D 
##D ## sensitivity
##D sens<-sobol(mod,mcmc.use=1:10) # for speed, only use a few samples
##D plot(sens) # functional variable labelled "a"
##D 
##D sens.func<-sobol(mod,mcmc.use=1:10,func.var=1)
##D plot(sens.func)
## End(Not run)

## minimal example for CRAN testing
mod<-bass(1:2,1:2,nmcmc=2,nburn=1)



