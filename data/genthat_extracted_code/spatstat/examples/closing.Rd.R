library(spatstat)


### Name: closing
### Title: Morphological Closing
### Aliases: closing closing.owin closing.ppp closing.psp
### Keywords: spatial math

### ** Examples

  v <- closing(letterR, 0.25)
  plot(v, main="closing")
  plot(letterR, add=TRUE)

  plot(closing(cells, 0.1))
  points(cells)



