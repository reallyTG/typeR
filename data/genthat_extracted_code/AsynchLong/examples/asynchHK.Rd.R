library(AsynchLong)


### Name: asynchHK
### Title: Regression Analysis for Time-Invariant Coefficients Using
###   Half-Kernel Estimation
### Aliases: asynchHK

### ** Examples


  data(asynchDataTI)

  res <- asynchHK(data.x = TI.x, 
                  data.y = TI.y,
                  bw = c(0.05, 0.03),
                  kType = "epan", 
                  lType = "identity")




