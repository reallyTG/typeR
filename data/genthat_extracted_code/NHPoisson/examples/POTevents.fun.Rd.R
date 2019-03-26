library(NHPoisson)


### Name: POTevents.fun
### Title: Calculation of the extreme events using a POT approach
### Aliases: POTevents.fun

### ** Examples

data(BarTxTn)
dateB<-cbind(BarTxTn$ano,BarTxTn$mes,BarTxTn$diames)
BarEv<-POTevents.fun(T=BarTxTn$Tx,thres=318, date=dateB)



