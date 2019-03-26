library(agricolae)


### Name: normal.freq
### Title: Normal curve on the histogram
### Aliases: normal.freq
### Keywords: aplot

### ** Examples

library(agricolae)
data(growth)
#startgraph
h1<-with(growth,hist(height,col="green",xlim=c(6,14)))
normal.freq(h1,col="blue")
#endgraph
#startgraph
h2<-with(growth,graph.freq(height,col="yellow",xlim=c(6,14),frequency=2))
normal.freq(h2,frequency=2)
#endgraph



