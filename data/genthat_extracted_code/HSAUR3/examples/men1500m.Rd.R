library(HSAUR3)


### Name: men1500m
### Title: Winners of the Olympic Men's 1500m
### Aliases: men1500m
### Keywords: datasets

### ** Examples


  data("men1500m", package = "HSAUR3")
  op <- par(las = 2)
  plot(time ~ year, data = men1500m, axes = FALSE)
  yrs <- seq(from = 1896, to = 2004, by = 4)
  axis(1, at = yrs, labels = yrs)
  axis(2)
  box()
  par(op)




