library(spatstat)


### Name: rescale.owin
### Title: Convert Window to Another Unit of Length
### Aliases: rescale.owin
### Keywords: spatial math

### ** Examples

  data(swedishpines)
  W <- Window(swedishpines)
  W
# coordinates are in decimetres (0.1 metre)
# convert to metres:
  rescale(W, 10)
# or equivalently
  rescale(W)



