library(agricolae)


### Name: table.freq
### Title: frequency Table of a Histogram
### Aliases: table.freq
### Keywords: distribution

### ** Examples

library(agricolae)
data(growth)
h2<-with(growth,graph.freq(height,plot=FALSE))
print(table.freq(h2),row.names=FALSE)



