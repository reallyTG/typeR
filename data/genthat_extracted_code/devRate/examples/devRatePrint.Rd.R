library(devRate)


### Name: devRatePrint
### Title: Report model output from the NLS fit
### Aliases: devRatePrint

### ** Examples

myT <- 5:15
myDev <- -0.05 + rnorm(n = length(myT), mean = myT, sd = 1) * 0.01
myNLS <- devRateModel(eq = campbell_74, temp = myT, devRate = myDev,
  startValues = list(aa = 0, bb = 0))
devRatePrint(myNLS, temp = myT, devRate = myDev)

rawDevEggs <- matrix(c(10, 0.031, 10, 0.039, 15, 0.047, 15, 0.059, 15.5, 0.066,
   13, 0.072, 16, 0.083, 16, 0.100, 17, 0.100, 20, 0.100, 20, 0.143, 25, 0.171,
   25, 0.200, 30, 0.200, 30, 0.180, 35, 0.001), ncol = 2, byrow = TRUE)
mEggs <- devRateModel(eq = taylor_81, temp = rawDevEggs[,1], devRate = rawDevEggs[,2],
   startValues = list(Rm = 0.05, Tm = 30, To = 5))
devRatePrint(myNLS = mEggs, temp = rawDevEggs[, 1], devRate = rawDevEggs[, 2])



