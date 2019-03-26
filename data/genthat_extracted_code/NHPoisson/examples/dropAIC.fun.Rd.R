library(NHPoisson)


### Name: dropAIC.fun
### Title: Calculate the AIC for all one-covariate deletions from the
###   current model
### Aliases: dropAIC.fun

### ** Examples


data(BarTxTn)

BarEv<-POTevents.fun(T=BarTxTn$Tx,thres=318, 
	date=cbind(BarTxTn$ano,BarTxTn$mes,BarTxTn$dia))

covB<-cbind(cos(2*pi*BarTxTn$dia/365), sin(2*pi*BarTxTn$dia/365), 
	BarTxTn$TTx,BarTxTn$Txm31,BarTxTn$Txm31**2)

dimnames(covB)<-list(NULL,c('cos','sin','TTx','Txm31', 'Txm31**2'))

mod1B<-fitPP.fun(covariates=covB, posE=BarEv$Px, inddat=BarEv$inddat,
	tit="BAR Tx; cos, sin, TTx, Txm31, Txm31**2", 
	start=list(b0=-100,b1=1,b2=10,b3=0,b4=0,b5=0))


aux<-dropAIC.fun(mod1B)



