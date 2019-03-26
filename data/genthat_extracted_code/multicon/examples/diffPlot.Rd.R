library(multicon)


### Name: diffPlot
### Title: Difference Plot
### Aliases: diffPlot diffPlot.default diffPlot.formula
### Keywords: difference plot bargraph

### ** Examples

  # Independent Groups, default method
y <- rnorm(100)
g <- rep(1:2, each=50)
diffPlot(g, y, ylab="DV", xlab="", main="Plot of Means with Floating Axis for Mean Difference", 
grp.names=c("Control", "Experimental"), sub="Arms Indicate 95 Percent CIs")
  # Independent Groups, formula method
diffPlot(y ~ g, ylab="DV", xlab="", 
main="Plot of Means with Floating Axis for Mean Difference", 
grp.names=c("Control", "Experimental"), sub="Arms Indicate 95 Percent CIs")
  # Dependent Groups
library(mvtnorm)
myData <- rmvnorm(100, mean=c(0,.4), sigma=matrix(c(1,.8,.8,1), nrow=2, byrow=TRUE))
diffPlot(myData[,1], myData[,2], paired=TRUE, ylab="DV", xlab="", 
	main="Plot of Dependent Means with Floating Axis for Mean Difference", 
grp.names=c("Time 1", "Time 2"), sub="Arms Indicate 95 Percent CIs")



