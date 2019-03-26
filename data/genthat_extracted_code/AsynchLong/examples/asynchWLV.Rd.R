library(AsynchLong)


### Name: asynchWLV
### Title: Weighted Last Observation Carried Forward Regression Analysis
###   for Time-Invariant Coefficients
### Aliases: asynchWLV

### ** Examples


  data(asynchDataTI)

  res <- asynchWLV(data.x = TI.x, 
                   data.y = TI.y,
                   bw = c(0.05, 0.03),
                   kType = "epan", 
                   lType = "identity")




