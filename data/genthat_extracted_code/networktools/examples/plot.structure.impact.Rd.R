library(networktools)


### Name: plot.structure.impact
### Title: Plot "structure.impact" objects
### Aliases: plot.structure.impact

### ** Examples

out <- structure.impact(depression[,1:5])
plot(out)
## No test: 
out1 <- structure.impact(depression)
plot(out1)
plot(out1, order="value", zscore=TRUE)
out2 <- impact(depression)
plot(out2$Network.Structure)
## End(No test)



