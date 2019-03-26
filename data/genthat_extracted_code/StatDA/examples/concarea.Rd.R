library(StatDA)


### Name: concarea
### Title: Plot Concentration Area
### Aliases: concarea
### Keywords: dplot

### ** Examples

data(ohorizon)
data(kola.background)
data(bordersKola)

Cu=ohorizon[,"Cu"]
X=ohorizon[,"XCOO"]
Y=ohorizon[,"YCOO"]

par(mfrow=c(1,2),mar=c(4,4,2,2))
concarea(X,Y,Cu,log=TRUE,zname="Cu in O-horizon [mg/kg]",borders="bordersKola", ifrev=FALSE,
         x.logfinetick=c(2,5,10),y.logfinetick=c(10))
	



