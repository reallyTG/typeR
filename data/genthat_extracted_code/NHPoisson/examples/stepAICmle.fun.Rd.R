library(NHPoisson)


### Name: stepAICmle.fun
### Title: Selection of the best model with a stepwise algorithm
### Aliases: stepAICmle.fun checkdim

### ** Examples



data(BarTxTn)

BarEv<-POTevents.fun(T=BarTxTn$Tx,thres=318, 
	date=cbind(BarTxTn$ano,BarTxTn$mes,BarTxTn$dia))

#The initial model contains only the inercept
 mod1Bind<-fitPP.fun(covariates=NULL, posE=BarEv$Px, inddat=BarEv$inddat,
	tit='BAR  Intercept ', 	start=list(b0=1))
#the potential covariates
covB<-cbind(cos(2*pi*BarTxTn$dia/365), sin(2*pi*BarTxTn$dia/365), 
	BarTxTn$TTx,BarTxTn$Txm31,BarTxTn$Txm31**2)
dimnames(covB)<-list(NULL,c('cos','sin','TTx','Txm31', 'Txm31**2'))

bb<-stepAICmle.fun(ImlePP=mod1Bind, covariates=covB, startAdd=c(1,-1,0,0,0), 
direction='both')




