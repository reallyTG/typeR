library(agricolae)


### Name: ogive.freq
### Title: Plotting the ogive from a histogram
### Aliases: ogive.freq
### Keywords: aplot

### ** Examples

library(agricolae)
data(growth)
h<-graph.freq(growth$height,plot=FALSE)
points<-ogive.freq(h,col="red",frame=FALSE,
xlab="Height", ylab="Accumulated relative frequency", main="ogive")
plot(points,type="b",pch=16,las=1,bty="l")



