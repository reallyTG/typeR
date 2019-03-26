library(spatstat)


### Name: plot.owin
### Title: Plot a Spatial Window
### Aliases: plot.owin
### Keywords: spatial hplot

### ** Examples

  # rectangular window
   plot(Window(nztrees))
   abline(v=148, lty=2)

  # polygonal window
  w <- Window(demopat)
  plot(w)
  plot(w, col="red", border="green", lwd=2)
  plot(w, hatch=TRUE, lwd=2)

  # binary mask
  we <- as.mask(w)
  plot(we)
  op <- spatstat.options(par.binary=list(col=grey(c(0.5,1))))
  plot(we)
  spatstat.options(op)



