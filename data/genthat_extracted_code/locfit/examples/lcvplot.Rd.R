library(locfit)


### Name: lcvplot
### Title: Compute the likelihood cross-validation plot.
### Aliases: lcvplot
### Keywords: htest

### ** Examples

data(ethanol)
plot(lcvplot(NOx~E,data=ethanol,alpha=seq(0.2,1.0,by=0.05)))



