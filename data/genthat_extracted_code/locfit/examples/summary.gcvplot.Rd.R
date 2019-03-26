library(locfit)


### Name: summary.gcvplot
### Title: Summary method for a gcvplot structure.
### Aliases: summary.gcvplot
### Keywords: methods

### ** Examples

data(ethanol)
summary(gcvplot(NOx~E,data=ethanol,alpha=seq(0.2,1.0,by=0.05)))



