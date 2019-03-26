library(agricolae)


### Name: summary.graph.freq
### Title: frequency Table of a Histogram
### Aliases: summary.graph.freq
### Keywords: distribution

### ** Examples

library(agricolae)
data(growth)
h2<-with(growth,graph.freq(height,plot=FALSE))
print(summary(h2),row.names=FALSE)



