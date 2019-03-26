library(IndTestPP)


### Name: DistObs.fun
### Title: Calculates the set of close points and the mean distance for
###   each point in the first process of a set or two or three processes
### Aliases: DistObs.fun calcdist.fun

### ** Examples




data(BarTxTn)
dateB<-cbind(BarTxTn$ano,BarTxTn$mes,BarTxTn$diames)
BarBivEv<-CPSPPOTevents.fun(X=BarTxTn$Tx,Y=BarTxTn$Tn,thresX=318,
	thresY=220, date=dateB)
DistObs.fun(BarBivEv$PxX, BarBivEv$PxY, BarBivEv$PxXY,info = TRUE)




