library(IndTestPP)


### Name: depchi.fun
### Title: Estimates extremal dependence measures between two variables
### Aliases: depchi.fun

### ** Examples


data(BarTxTn)

aux<-depchi.fun(X=BarTxTn$Tx,Y=BarTxTn$Tn, thresval = c(0:99)/100, 
	tit = "Barcelona", xlegend = "topleft")



