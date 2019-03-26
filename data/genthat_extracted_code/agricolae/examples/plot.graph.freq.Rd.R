library(agricolae)


### Name: plot.graph.freq
### Title: Histogram
### Aliases: plot.graph.freq
### Keywords: aplot

### ** Examples


library(agricolae)
data(genxenv)
yield <- subset(genxenv$YLD,genxenv$ENV==2)
yield <- round(yield,1)
h<- graph.freq(yield,axes=FALSE, frequency=1, ylab="frequency",col="yellow")
axis(1,h$breaks)
axis(2,seq(0,20,0.1))
# To reproduce histogram.
h1 <- plot(h, col="blue", frequency=2,border="red", density=8,axes=FALSE, 
xlab="YIELD",ylab="relative")
axis(1,h$breaks)
axis(2,seq(0,.4,0.1))
# summary, only frecuency
limits <-seq(10,40,5)
frequencies <-c(2,6,8,7,3,4)
#startgraph
h<-graph.freq(limits,counts=frequencies,col="bisque",xlab="Classes")
polygon.freq(h,col="red")
title( main="Histogram and polygon of frequency",
ylab=".frequency")
#endgraph
# Statistics
measures<-stat.freq(h)
print(measures)
# frequency table full
round(table.freq(h),2)
#startgraph
# ogive
ogive.freq(h,col="red",type="b",ylab="Accumulated relative frequency",
xlab="Variable")
# only frequency polygon
h<-graph.freq(limits,counts=frequencies,border=FALSE,col=NULL,xlab="  ",ylab="")
title( main="Polygon of frequency",
xlab="Variable", ylab="Frecuency")
polygon.freq(h,col="blue")
grid(col="brown")
#endgraph
# Draw curve for Histogram
h<- graph.freq(yield,axes=FALSE, frequency=3, ylab="f(yield)",col="yellow")
axis(1,h$breaks)
axis(2,seq(0,0.18,0.03),las=2)
lines(density(yield), col = "red", lwd = 2)
title("Draw curve for Histogram")



