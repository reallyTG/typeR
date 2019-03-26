library(agricolae)


### Name: intervals.freq
### Title: Class intervals
### Aliases: intervals.freq
### Keywords: univar

### ** Examples

library(agricolae)
# example 1
data(growth)
h<-hist(growth$height,plot=FALSE)
intervals.freq(h)
# example 2
x<-seq(10,40,5)
y<-c(2,6,8,7,3,4)
intervals.freq(x)
histogram <- graph.freq(x,counts=y)



