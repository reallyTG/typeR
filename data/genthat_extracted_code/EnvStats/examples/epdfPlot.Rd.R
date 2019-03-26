library(EnvStats)


### Name: epdfPlot
### Title: Plot Empirical Probability Density Function
### Aliases: epdfPlot 'empirical PDF'
### Keywords: distribution hplot

### ** Examples

  # Using Reference Area TcCB data in EPA.94b.tccb.df, 
  # create a histogram of the log-transformed observations, 
  # then superimpose the empirical pdf plot.

  dev.new()
  log.TcCB <- with(EPA.94b.tccb.df, log(TcCB[Area == "Reference"]))

  hist(log.TcCB, freq = FALSE, xlim = c(-2, 1),
    col = "cyan", xlab = "log [ TcCB (ppb) ]",
    ylab = "Relative Frequency", 
    main = "Reference Area TcCB with Empirical PDF")

  epdfPlot(log.TcCB, add = TRUE)

  #==========

  # Generate 20 observations from a Poisson distribution with 
  # parameter lambda = 10, and plot the empirical PDF.

  set.seed(875)
  x <- rpois(20, lambda = 10)
  dev.new()
  epdfPlot(x, discrete = TRUE)

  #==========

  # Clean up
  #---------
  rm(log.TcCB, x)
  graphics.off()



