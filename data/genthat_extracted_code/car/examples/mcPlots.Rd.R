library(car)


### Name: mcPlots
### Title: Draw Linear Model Marginal and Conditional Plots in Parallel or
###   Overlaid
### Aliases: mcPlots mcPlot mcPlot.lm
### Keywords: hplot regression

### ** Examples

m1 <- lm(partic ~ tfr + menwage + womwage + debt + parttime, data = Bfox)
mcPlot(m1, "womwage")
mcPlot(m1, "womwage", overlaid=FALSE, ellipse=TRUE)



