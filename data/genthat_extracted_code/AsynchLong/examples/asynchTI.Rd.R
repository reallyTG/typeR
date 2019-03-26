library(AsynchLong)


### Name: asynchTI
### Title: Regression Analysis for Time-Invariant Coefficients
### Aliases: asynchTI

### ** Examples


  data(asynchDataTI)

  res <- asynchTI(data.x = TI.x, 
                  data.y = TI.y,
                  bw = c(0.05, 0.03),
                  kType = "epan", 
                  lType = "identity")




