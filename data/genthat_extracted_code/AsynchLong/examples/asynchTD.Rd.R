library(AsynchLong)


### Name: asynchTD
### Title: Regression Analysis for Time-Dependent Coefficients
### Aliases: asynchTD

### ** Examples


  data(asynchDataTD)

  res <- asynchTD(data.x = TD.x, 
                  data.y = TD.y,
                  times = c(0.25, 0.50, 0.75),
                  bw = 0.05,
                  kType = "epan", 
                  lType = "identity")





