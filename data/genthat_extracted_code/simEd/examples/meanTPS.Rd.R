library(simEd)


### Name: meanTPS
### Title: Mean of Time-Persistent Statistics (TPS)
### Aliases: meanTPS
### Keywords: utilities

### ** Examples

  times <- c(1,2,3,4,5)
  counts <- c(1,2,1,1,2)
  meanTPS(times, counts)

  output <- ssq(seed = 54321, maxTime = 1000, saveServerStatus = TRUE)
  utilization <- meanTPS(output$serverStatusT, output$serverStatusN)

  # compute and graphically display mean of number in system vs time
  output <- ssq(maxArrivals = 60, seed = 54321, saveAllStats = TRUE) 
  plot(output$numInSystemT, output$numInSystemN, type = "s", bty = "l", las = 1,
      xlab = "time", ylab = "number in system")
  timeAvgNumInSysMean <- meanTPS(output$numInSystemT, output$numInSystemN)
  abline(h = timeAvgNumInSysMean, lty = "solid", col = "red", lwd = 2)



