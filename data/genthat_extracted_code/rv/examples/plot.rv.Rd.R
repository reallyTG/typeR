library(rv)


### Name: plot.rv
### Title: Plotting Scatterplots of Random Variable Objects
### Aliases: plot.rv plot.rvsummary
### Keywords: aplot

### ** Examples


  x <- as.rv(1:30)
  y <- rvnorm(mean=x, sd=1)
  ## Not run: plot(x, y)
  ## Not run: plot(y, x)
  ## Not run: plot(y)
  y <- as.rvsummary(x)
  ## Not run: plot(x, y)
  ## Not run: plot(y, x)
  ## Not run: plot(y)




