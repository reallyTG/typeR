library(NHPoisson)


### Name: LRTpv.fun
### Title: Likelihood ratio test of the covariates in a model
### Aliases: LRTpv.fun

### ** Examples

data(BarTxTn)
covB<-cbind(cos(2*pi*BarTxTn$dia/365), sin(2*pi*BarTxTn$dia/365), 
	BarTxTn$TTx,BarTxTn$Txm31,BarTxTn$Txm31**2)
BarEv<-POTevents.fun(T=BarTxTn$Tx,thres=318, 
	date=cbind(BarTxTn$ano,BarTxTn$mes,BarTxTn$dia))

mod1B<-fitPP.fun(tind=TRUE,covariates=covB, 
	posE=BarEv$Px, inddat=BarEv$inddat,
	tit="BAR Tx; cos, sin, TTx, Txm31, Txm31**2", 
	start=list(b0=-100,b1=1,b2=10,b3=0,b4=0,b5=0),dplot=FALSE, modCI=FALSE)

LRTpv.fun(mod1B)



