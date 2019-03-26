library(fgac)


### Name: fitCBB
### Title: fitCBB
### Aliases: fitCBB
### Keywords: multivariate

### ** Examples
#x<-rnorm(100)
#y<-x/10+rnorm(100)
#M<-fitCBB(x,y) # default fitting 
#default: thetas0 and delta0 from fitlambdas function,  m=15, step=0.01,
#copulamodel="pCBB1", test="wilcox.test", empcumulative=TRUE.
#
#M<-fitCBB(x,y,theta0=1.1,delta0=0.8,copulamodel="pCBB5",m=20,step=0.5,deltamin=0.1,thetamin=1.1, 
#test="w",empcumulative=FALSE,cumulative1=pnorm,cumulative2=pnorm)
#
#x<-rnorm(100)
#y<-x/100+rnorm(100,5,2)
#M<-fitCBB(x,y,theta0=1.1,delta0=0.8,copulamodel="pCBB7",m=20,step=0.5,deltamin=0.1,thetamin=1.1,
#test="t",empcumulative=FALSE,cumulative1=pnorm,cumulative2=pnorm,parameters2=c(5,2))





