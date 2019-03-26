library(agricolae)


### Name: polygon.freq
### Title: The polygon of frequency on the histogram
### Aliases: polygon.freq
### Keywords: aplot

### ** Examples

library(agricolae)
data(growth)
#startgraph
h1<-with(growth,hist(height,border=FALSE,xlim=c(6,14)))
polygon.freq(h1,frequency=1,col="red")
#endgraph
#startgraph
h2<-with(growth,graph.freq(height,frequency=2,col="yellow",xlim=c(6,14)))
polygon.freq(h2,frequency=2,col="red")
#endgraph



