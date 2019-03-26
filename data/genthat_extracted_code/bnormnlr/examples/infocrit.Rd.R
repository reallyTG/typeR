library(bnormnlr)


### Name: infocrit
### Title: Expected Number of Parameters, DIC, AIC and BIC for bnlr fit.
### Aliases: infocrit

### ** Examples

#######################################
###Simulation of heteroscedastic model
#######################################
utils::data(muscle, package = "MASS")
###mean and variance functions
fmu<-function(param,cov){ param[1] + param[2]*exp(-cov/exp(param[3]))}
fsgma<-function(param,cov){drop(exp(cov%*%param))}

###simulate heteroscedastic data
muscle$Length<-fmu(c(28.9632978, -34.2274097,  -0.4972977),muscle$Conc)+
rnorm(60,0,sqrt(exp(log(2)+.8*muscle$Conc)))

##Note: use more MCMC chains (i.e NC=10000) for more accurate results.
m2b<-bnlr(y=muscle$Length,f1=fmu,f2=fsgma,x=muscle$Conc,
z=matrix(rep(1,length(muscle$Length)),ncol=1),bta0=c(20,-30,-1),gma0=2,Nc=650)
m1b<-bnlr(y=muscle$Length,f1=fmu,f2=fsgma,x=muscle$Conc,z=cbind(1,muscle$Conc),
bta0=c(20,-30,0),gma0=c(.5,.5),Nc=650)

chainsum(m1b$chains,burn=1:65)
chainsum(m2b$chains,burn=1:65)
infocrit(m1b,1:65)
infocrit(m2b,1:65)



