library(spatstat)


### Name: plot.textstring
### Title: Plot a Text String
### Aliases: plot.textstring
### Keywords: spatial hplot

### ** Examples

  W <- Window(humberside)
  te <- textstring(centroid.owin(W), txt="Humberside", cex=2.5)
  te
  plot(layered(W, te), main="")



