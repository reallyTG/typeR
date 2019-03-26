library(spatstat)


### Name: tweak.colourmap
### Title: Change Colour Values in a Colour Map
### Aliases: tweak.colourmap
### Keywords: spatial color

### ** Examples

  co <- colourmap(rainbow(32), range=c(0,1))
  plot(tweak.colourmap(co, inputs=c(0.5, 0.6), "white"))
  plot(tweak.colourmap(co, range=c(0.5,0.6), "white"))



