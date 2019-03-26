library(plotrix)


### Name: dendroPlot
### Title: Display distributions as dendrites
### Aliases: dendroPlot
### Keywords: misc

### ** Examples

 x<-list(runif(90,1,3),factor(sample(LETTERS[1:10],100,TRUE)),rnorm(80,mean=5))
 dendroPlot(x,xlab="Groups",ylab="Value of x",main="Test dendroPlot I")
 # now apply a nudge factor and different breaks
 dendroPlot(x,breaks=list(8,10,10),nudge=c(0.05,0.1),
  xlab="Groups",ylab="Value of x",main="Test dendroPlot II")



