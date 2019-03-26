library(StatDA)


### Name: bubbleFIN
### Title: Bubbleplot due to Finnish method
### Aliases: bubbleFIN
### Keywords: multivariate

### ** Examples

data(kola.background)
data(ohorizon)
el=ohorizon[,"Mg"]
X=ohorizon[,"XCOO"]
Y=ohorizon[,"YCOO"]
plot(X,Y,frame.plot=FALSE,xaxt="n",yaxt="n",xlab="",ylab="",type="n") #plot bubbles with background
plotbg(map.col=c("gray","gray","gray","gray"),add.plot=TRUE)

bubbleFIN(X,Y,el,S=9,s=2,plottitle="",legendtitle="Mg [mg/kg]", text.cex=0.63,legtitle.cex=0.80)



