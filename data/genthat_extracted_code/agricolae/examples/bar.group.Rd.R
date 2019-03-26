library(agricolae)


### Name: bar.group
### Title: Plotting the multiple comparison of means
### Aliases: bar.group
### Keywords: aplot

### ** Examples

# Example 1
library(agricolae)
data(sweetpotato)
model<-aov(yield~virus,data=sweetpotato)
comparison<- LSD.test(model,"virus",alpha=0.01,group=TRUE)
print(comparison$groups)
#startgraph
par(cex=1.5)
bar.group(comparison$groups,horiz=TRUE,density=8,col="blue",border="red",
xlim=c(0,50),las=1)
title(cex.main=0.8,main="Comparison between\ntreatment means",xlab="Yield",ylab="Virus")
#endgraph
# Example 2
library(agricolae)
x <- 1:4
y <- c(0.29, 0.44, 0.09, 0.49)
xy <- data.frame(x,y,y)
#startgraph
par(cex=1.5)
bar.group(xy,density=30,angle=90,col="brown",border=FALSE,ylim=c(0,0.6),lwd=2,las=1)
#endgraph



