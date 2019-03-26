library(NHPoisson)


### Name: globalval.fun
### Title: Global validation analysis of a NHPP
### Aliases: globalval.fun

### ** Examples


data(BarTxTn)

covB<-cbind(cos(2*pi*BarTxTn$dia/365), sin(2*pi*BarTxTn$dia/365), 
	BarTxTn$TTx,BarTxTn$Txm31,BarTxTn$Txm31**2)


modB<-fitPP.fun(tind=TRUE,covariates=covB, 
	POTob=list(T=BarTxTn$Tx, thres=318),
	tit="BAR Tx; cos, sin, TTx, Txm31, Txm31**2", 
	start=list(b0=-100,b1=1,b2=10,b3=0,b4=0,b5=0),CIty="Transf",modCI=TRUE,
	modSim=TRUE,dplot=FALSE)

#Since  only one graphical device is opened  and  the argument histWgraph is TRUE 
#by default, the different plots can be scrolled up and down with the "Page Up" 
#and "Page Down" keys.

aux<-globalval.fun(mlePP=modB,lint=153,	typeI="Disjoint", 
	typeRes="Raw",typeResLV="Raw",	resqqplot=FALSE)

#If typeRes and typeResLV are not specified, Pearson residuals are calculated
#by default.

aux<-globalval.fun(mlePP=modB,lint=153,	typeI="Disjoint", 
	resqqplot=FALSE)





