library(PTXQC)


### Name: peakWidthOverTime
### Title: Discretize RT peak widths by averaging values per time bin.
### Aliases: peakWidthOverTime

### ** Examples

  data = data.frame(retention.time = seq(30,200, by=0.001)) ## one MS/MS per 0.1 sec
  data$retention.length = seq(0.3, 0.6, length.out = nrow(data)) + rnorm(nrow(data), 0, 0.1)
  d = peakWidthOverTime(data)
  plot(d$RT, d$peakWidth)
  
  



