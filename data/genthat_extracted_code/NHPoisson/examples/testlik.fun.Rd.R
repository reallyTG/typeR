library(NHPoisson)


### Name: testlik.fun
### Title: Likelihood ratio test to compare two nested models
### Aliases: testlik.fun

### ** Examples


##The alternative model modB is specified  by the output fitPP.fun
##The null model modBR is specified  by a list with elments llik and npar


data(BarTxTn)

covB<-cbind(cos(2*pi*BarTxTn$dia/365), sin(2*pi*BarTxTn$dia/365), 
	BarTxTn$TTx,BarTxTn$Txm31,BarTxTn$Txm31**2)


modB<-fitPP.fun(tind=TRUE,covariates=covB, POTob=list(T=BarTxTn$Tx, thres=318),
	tim=c(1:8415), tit="BAR Tx; cos, sin, TTx, Txm31, Txm31**2", 
	start=list(b0=-100,b1=1,b2=10,b3=0,b4=0,b5=0),dplot=FALSE,modCI=TRUE,
	modSim=TRUE)

modBR<-fitPP.fun(tind=TRUE,covariates=covB[,1:4], 
	POTob=list(T=BarTxTn$Tx, thres=318),
	tim=c(1:8415), tit="BAR Tx; cos, sin, TTx, Txm31", 
	start=list(b0=-100,b1=1,b2=10,b3=0,b4=0),dplot=FALSE,modCI=TRUE,	modSim=TRUE)


aux<-testlik.fun(ModG=modB,ModR=modBR)





