library(spatstat)


### Name: plot.colourmap
### Title: Plot a Colour Map
### Aliases: plot.colourmap
### Keywords: spatial color hplot

### ** Examples

  co <- colourmap(rainbow(100), breaks=seq(-1,1,length=101))
  plot(co)
  plot(co, col.ticks="pink")
  ca <- colourmap(rainbow(8), inputs=letters[1:8])
  plot(ca, vertical=TRUE)



