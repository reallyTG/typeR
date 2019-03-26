library(devRate)


### Name: devRateModel
### Title: Compute non-linear regression
### Aliases: devRateModel

### ** Examples

## Example with a linear model (no starting estimates)
myT <- 5:15
myDev <- -0.05 + rnorm(n = length(myT), mean = myT, sd = 1) * 0.01
myNLS <- devRateModel(eq = campbell_74, temp = myT, devRate = myDev)
## Example with a non-linear model (starting estimates)
myT <- seq(from = 0, to = 50, by = 10)
myDev <- c(0.001, 0.008, 0.02, 0.03, 0.018, 0.004)
myNLS <- devRateModel(eq = stinner_74, temp = myT, devRate = myDev,
  startValues = list(list(C = 0.05, k1 = 5, k2 = -0.3), list(Topt = 30)))
## Example with a data.frame instead of two vectors for temperature and
## development rate
myDF <- data.frame(myT, myDev)
myNLS <- devRateModel(eq = campbell_74, df = myDF)



