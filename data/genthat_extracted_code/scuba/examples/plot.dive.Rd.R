library(scuba)


### Name: plot.dive
### Title: Plot a Dive Profile
### Aliases: plot.dive
### Keywords: utilities

### ** Examples

  # Dive to 25 m for 20 min with safety stop
  d1 <- dive(c(25,20),c(5,5))
  # plot it
  plot.dive(d1)
  # Dive to 18 m for 30 min with safety stop, on Nitrox EANx 36
  d3 <- dive(nitrox(0.36), c(18,30), c(5,3))
  plot.dive(d3)
  # Real dive profile
  data(baron)
  d4 <- dive(nitrox(0.30), baron[, 1:2])
  plot(d4, main="Baron Gautsch dive")



