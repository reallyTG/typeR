library(wasim)


### Name: line_sumrain
### Title: Draw line of cumulative rainfall
### Aliases: line_sumrain
### Keywords: utilities hplot

### ** Examples

  #Uniform rain
  plot(1:100, rep(1, 100),ylim=c(10,0),type="h", xlab="time", ylab="rainfall")
  line_sumrain(xdata=1:100, cum_sum_rain=(1:100), theMax=10)



