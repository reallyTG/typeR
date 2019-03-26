library(agricolae)


### Name: sturges.freq
### Title: Class intervals for a histogram, the rule of Sturges
### Aliases: sturges.freq
### Keywords: manip

### ** Examples

library(agricolae)
data(natives)
classes<-with(natives,sturges.freq(size))
# information of the classes
breaks <- classes$breaks
breaks
#startgraph
# Histogram with the established classes
h<-with(natives,graph.freq(size,breaks,frequency=1, col="yellow",axes=FALSE,
    xlim=c(0,0.12),main="",xlab="",ylab=""))
axis(1,breaks,las=2)
axis(2,seq(0,400,50),las=2)
title(main="Histogram of frequency\nSize of the tubercule of the Oca",
xlab="Size of the oca", ylab="Frequency")
#endgraph



