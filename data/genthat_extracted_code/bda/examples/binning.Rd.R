library(bda)


### Name: binning
### Title: Data Binning
### Aliases: binning binning.default binning.histogram plot.bdata
###   print.bdata quantile.bdata
### Keywords: distribution stats

### ** Examples


  y <- c(10, 21, 56,79,114,122,110,85,85,61,47,49,47,44,31,20,11,4,4)
  x <- 14.5 + c(0:length(y))
  out1 <- binning(counts=y, breaks=x)
  plot(out1)




