library(networktools)


### Name: plot.all.impact
### Title: Plot "all.impact" objects
### Aliases: plot.all.impact

### ** Examples

out <- impact(depression[,1:5])
plot(out)
## No test: 
out1 <- impact(depression)
plot(out1)
plot(out1, order="value", zscore=TRUE)
## End(No test)



