library(NHPoisson)


### Name: fitPP.fun
### Title: Fit of a non homogeneous Poisson Process
### Aliases: fitPP.fun

### ** Examples

#model fitted  using as input posE and inddat and  no confidence intervals 

data(BarTxTn)
covB<-cbind(cos(2*pi*BarTxTn$dia/365), sin(2*pi*BarTxTn$dia/365), 
	BarTxTn$TTx,BarTxTn$Txm31,BarTxTn$Txm31**2)
BarEv<-POTevents.fun(T=BarTxTn$Tx,thres=318, 
	date=cbind(BarTxTn$ano,BarTxTn$mes,BarTxTn$dia))


mod1B<-fitPP.fun(covariates=covB, 
	posE=BarEv$Px, inddat=BarEv$inddat,
	tit="BAR Tx; cos, sin, TTx, Txm31, Txm31**2", 
	start=list(b0=-100,b1=1,b2=-1,b3=0,b4=0,b5=0))

#model fitted  using as input  a list from POTevents.fun and with  confidence intervals 

tiempoB<-BarTxTn$ano+rep(c(0:152)/153,55)

mod2B<-fitPP.fun(covariates=covB, 
	POTob=list(T=BarTxTn$Tx, thres=318),
	tim=tiempoB, tit="BAR Tx; cos, sin, TTx, Txm31, Txm31**2", 
	start=list(b0=-100,b1=1,b2=-1,b3=0,b4=0,b5=0),CIty="Delta",modCI=TRUE,
	modSim=TRUE)

#model  with a fixed parameter (b0)

mod1BF<-fitPP.fun(covariates=covB, 
	posE=BarEv$Px, inddat=BarEv$inddat,
	tit="BAR Tx; cos, sin, TTx, Txm31, Txm31**2", 
	start=list(b0=-89,b1=1,b2=10,b3=0,b4=0,b5=0), 
	fixed=list(b0=-100))



