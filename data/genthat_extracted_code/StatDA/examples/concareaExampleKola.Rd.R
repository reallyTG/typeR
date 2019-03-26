library(StatDA)


### Name: concareaExampleKola
### Title: Concentration Area Plot for Kola data example
### Aliases: concareaExampleKola
### Keywords: dplot

### ** Examples

data(ohorizon)
data(kola.background)
data(bordersKola)

Cu=ohorizon[,"Cu"]
X=ohorizon[,"XCOO"]
Y=ohorizon[,"YCOO"]


par(mfrow=c(2,2),mar=c(1.5,1.5,1.5,1.5))
concareaExampleKola(X,Y,Cu,log=TRUE,zname="Cu in O-horizon [mg/kg]",
   x.logfinetick=c(2,5,10),y.logfinetick=c(10))
	



