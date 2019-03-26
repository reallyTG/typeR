library(locfit)


### Name: plot.gcvplot
### Title: Produce a cross-validation plot.
### Aliases: plot.gcvplot
### Keywords: methods

### ** Examples

data(ethanol)
plot(gcvplot(NOx~E,data=ethanol,alpha=seq(0.2,1.0,by=0.05)))



