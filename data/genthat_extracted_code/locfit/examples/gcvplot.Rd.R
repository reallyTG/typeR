library(locfit)


### Name: gcvplot
### Title: Compute a generalized cross-validation plot.
### Aliases: gcvplot
### Keywords: htest

### ** Examples

data(ethanol)
plot(gcvplot(NOx~E,data=ethanol,alpha=seq(0.2,1.0,by=0.05)))



