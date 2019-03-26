library(simEd)


### Name: quantileTPS
### Title: Sample Quantiles of Time-Persistent Statistics (TPS)
### Aliases: quantileTPS
### Keywords: utilities

### ** Examples

  times <- c(1,2,3,4,5)
  counts <- c(1,2,1,1,2)
  meanTPS(times, counts)
  sdTPS(times, counts)
  quantileTPS(times, counts)

  output <- ssq(seed = 54321, maxTime = 1000, saveNumInSystem = TRUE)
  utilization <- meanTPS(output$numInSystemT, output$numInSystemN)
  sdServerStatus <- sdTPS(output$numInSystemT, output$numInSystemN)
  quantileServerStatus <- quantileTPS(output$numInSystemT, output$numInSystemN)

  # compute and graphically display quantiles of number in system vs time
  output <- ssq(maxArrivals = 60, seed = 54321, saveAllStats = TRUE)
  quantileSys <- quantileTPS(output$numInSystemT, output$numInSystemN)
  plot(output$numInSystemT, output$numInSystemN, type = "s", bty = "l", las = 1,
      xlab = "time", ylab = "number in system")
  labels <- c("0%", "25%", "50%", "75%", "100%")
  mtext(text = labels, side = 4, at = quantileSys, las = 1, col = "red")
  abline(h = quantileSys, lty = "dashed", col = "red", lwd = 2)




