library(spatstat)


### Name: rescale.im
### Title: Convert Pixel Image to Another Unit of Length
### Aliases: rescale.im
### Keywords: spatial math

### ** Examples

# Bramble Canes data: 1 unit = 9 metres
  data(bramblecanes)
# distance transform
  Z <- distmap(bramblecanes)
# convert to metres
# first alter the pixel values
  Zm <- eval.im(9 * Z)
# now rescale the pixel coordinates
  Z <- rescale(Zm, 1/9)
# or equivalently
  Z <- rescale(Zm)



