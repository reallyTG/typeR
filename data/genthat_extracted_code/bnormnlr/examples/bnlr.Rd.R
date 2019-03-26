library(bnormnlr)


### Name: bnlr
### Title: Bayesian Estimation for Normal Heteroscedastic Nonlinear
###   Regression Models.
### Aliases: bnlr

### ** Examples


######################################################
###Simulation of heteroscedastic model, using gradient
######################################################
library(car)
library(coda)
utils::data(muscle, package = "MASS")
###mean and variance functions
fmu<-function(param,cov){ param[1] + param[2]*exp(-cov/exp(param[3]))}
fsgma<-function(param,cov){drop(exp(cov%*%param))}

###simulate heteroscedastic data
muscle$Length<-fmu(c(28.9632978, -34.2274097,  -0.4972977),muscle$Conc)+
rnorm(60,0,sqrt(exp(log(2)+.8*muscle$Conc)))

####gradients
fmug<-function(param,cov){ 
cbind(1,exp(-cov/exp(param[3])),param[2]*exp(-cov/exp(param[3]))*cov/exp(param[3]))}
fsgmag<-function(param,cov){ cbind(drop(exp(cov%*%param)),drop(exp(cov%*%param))*cov[,2])}

###without gradient
m1b<-bnlr(y=muscle$Length,f1=fmu,f2=fsgma,x=muscle$Conc,z=cbind(1,muscle$Conc)
,bta0=c(20,-30,0),gma0=c(.5,.5),Nc=500)
###with gradient
m2b<-bnlr(y=muscle$Length,f1=fmu,f2=fsgma,x=muscle$Conc,z=cbind(1,muscle$Conc),
bta0=c(20,-30,0),gma0=c(.5,.5),Nc=500)

chainsum(m1b$chains,burn=1:50)
chainsum(m2b$chains,burn=1:50)
infocrit(m1b,1:50)
infocrit(m2b,1:50)
##Note: use more MCMC chains (i.e NC=10000) for more accurate results.




