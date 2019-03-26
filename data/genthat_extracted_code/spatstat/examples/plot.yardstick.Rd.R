library(spatstat)


### Name: plot.yardstick
### Title: Plot a Yardstick or Scale Bar
### Aliases: plot.yardstick
### Keywords: spatial hplot

### ** Examples

  plot(owin(), main="Yardsticks")
  ys <- yardstick(as.psp(list(xmid=0.5, ymid=0.1, length=0.4, angle=0),
                         window=owin(c(0.2, 0.8), c(0, 0.2))),
                  txt="1 km")
  plot(ys)
  ys <- shift(ys, c(0, 0.3))
  plot(ys, angle=90, frac=0.08)
  ys <- shift(ys, c(0, 0.3))
  plot(ys, split=TRUE)



