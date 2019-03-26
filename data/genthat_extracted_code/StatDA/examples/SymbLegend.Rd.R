library(StatDA)


### Name: SymbLegend
### Title: Plot Legend
### Aliases: SymbLegend
### Keywords: aplot

### ** Examples

data(chorizon)
data(kola.background)
el=chorizon[,"As"]
X=chorizon[,"XCOO"]
Y=chorizon[,"YCOO"]

plot(X,Y,frame.plot=FALSE,xaxt="n",yaxt="n",xlab="",ylab="",type="n")
plotbg(map.col=c("gray","gray","gray","gray"),add.plot=TRUE)

SymbLegend(X,Y,el,type="percentile",qutiles<-c(0,0.05,0.25,0.75,0.95,1),symbtype="EDA",
symbmagn=0.8,leg.position="topright",leg.title="As [mg/kg]",leg.title.cex=0.8,leg.round=2,
leg.wid=4,leg.just="right")



