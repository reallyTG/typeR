library(StatDA)


### Name: edaplotlog
### Title: Edaplot for logtransformed data
### Aliases: edaplotlog
### Keywords: univar

### ** Examples

data(chorizon)
Ba=chorizon[,"Ba"]
edaplotlog(Ba,H.freq=FALSE,box=TRUE,H.breaks=30,S.pch=3,S.cex=0.5,D.lwd=1.5,P.log=FALSE,
  P.main="",P.xlab="Ba [mg/kg]",P.ylab="Density",B.pch=3,B.cex=0.5,B.log=TRUE)



