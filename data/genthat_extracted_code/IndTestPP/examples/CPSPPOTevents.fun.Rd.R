library(IndTestPP)


### Name: CPSPPOTevents.fun
### Title: Calculates the occurrence times of the three indicator processes
###   of the bivariate Common Poisson shock process resulting from applying
###   a POT approach
### Aliases: CPSPPOTevents.fun

### ** Examples

data(BarTxTn)
dateB<-cbind(BarTxTn$ano,BarTxTn$mes,BarTxTn$diames)
BarBivEv<-CPSPPOTevents.fun(X=BarTxTn$Tx,Y=BarTxTn$Tn,thresX=318,
	thresY=220, date=dateB)



