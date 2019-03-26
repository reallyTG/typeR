library(StatDA)


### Name: edaplot
### Title: EDA-plot for data
### Aliases: edaplot
### Keywords: univar

### ** Examples

data(chorizon)
Ba=chorizon[,"Ba"]
edaplot(Ba,H.freq=FALSE,box=TRUE,H.breaks=30,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
  P.main="",P.xlab="Ba [mg/kg]",P.ylab="Density",B.pch=3,B.cex=0.5)



