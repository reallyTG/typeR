library(networktools)


### Name: plot.global.impact
### Title: Plot "global.impact" objects
### Aliases: plot.global.impact

### ** Examples

out <- global.impact(depression[,1:5])
plot(out)
## No test: 
out1 <- global.impact(depression)
plot(out1)
plot(out1, order="value", zscore=TRUE)
out2 <- impact(depression)
plot(out2$Global.Strength)
## End(No test)



