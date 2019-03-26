library(StatDA)


### Name: varioCalc
### Title: Variogram Calculation
### Aliases: varioCalc
### Keywords: dplot

### ** Examples

data(ohorizon)
X=ohorizon[,"XCOO"]
Y=ohorizon[,"YCOO"]
vario.b=varioCalc(X,Y,el=ohorizon[,"Hg"],max.dist=300000,title=paste("Hg","in O-horizon"),
km=FALSE)



