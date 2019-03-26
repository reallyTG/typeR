library(NHPoisson)


### Name: emplambda.fun
### Title: Empirical occurrence rates of a NHPP on overlapping intervals
### Aliases: emplambda.fun

### ** Examples


data(BarTxTn)

BarEv<-POTevents.fun(T=BarTxTn$Tx,thres=318, 
	date=cbind(BarTxTn$ano,BarTxTn$mes,BarTxTn$dia))

# empirical rate based on overlapping intervals
emplambdaB<-emplambda.fun(posE=BarEv$Px,inddat=BarEv$inddat, t=c(1:8415), 
	lint=153,  tit="Barcelona")





