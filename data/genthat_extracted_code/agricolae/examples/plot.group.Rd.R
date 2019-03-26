library(agricolae)


### Name: plot.group
### Title: Plotting the multiple comparison of means
### Aliases: plot.group
### Keywords: aplot

### ** Examples

library(agricolae)
data(sweetpotato)
model<-aov(yield~virus,data=sweetpotato)
comparison<- LSD.test(model,"virus",alpha=0.01,group=TRUE)
#startgraph
par(cex=1.5)
plot(comparison,horiz=TRUE,xlim=c(0,50),las=1)
title(cex.main=0.8,main="Comparison between\ntreatment means",xlab="Yield",ylab="Virus")
#endgraph




