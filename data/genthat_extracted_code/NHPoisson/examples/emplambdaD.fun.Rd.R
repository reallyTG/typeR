library(NHPoisson)


### Name: emplambdaD.fun
### Title: Empirical occurrence rates of a NHPP on disjoint intervals
### Aliases: emplambdaD.fun

### ** Examples


data(BarTxTn)

BarEv<-POTevents.fun(T=BarTxTn$Tx,thres=318, 
	date=cbind(BarTxTn$ano,BarTxTn$mes,BarTxTn$dia))


# empirical rate based on disjoint intervals using nint to specify the intervals
emplambdaDB<-emplambdaD.fun(posE=BarEv$Px,inddat=BarEv$inddat, t=c(1:8415), 
	nint=55)

# empirical rate based on disjoint intervals using lint to specify the intervals
emplambdaDB<-emplambdaD.fun(posE=BarEv$Px,inddat=BarEv$inddat, t=c(1:8415), 
	lint=153)



