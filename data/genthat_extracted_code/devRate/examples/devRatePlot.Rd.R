library(devRate)


### Name: devRatePlot
### Title: Plot the empirical points and the regression
### Aliases: devRatePlot

### ** Examples

myT <- 5:15
myDev <- -0.05 + rnorm(n = length(myT), mean = myT, sd = 1) * 0.01
myNLS <- devRateModel(eq = campbell_74, temp = myT, devRate = myDev,
  startValues = list(aa = 0, bb = 0))
devRatePlot(eq = campbell_74, nlsDR = myNLS, temp = myT, devRate = myDev,
  spe = TRUE, pch = 16, lwd = 2, ylim = c(0, 0.10))



