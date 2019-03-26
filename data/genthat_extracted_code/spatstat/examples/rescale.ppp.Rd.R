library(spatstat)


### Name: rescale.ppp
### Title: Convert Point Pattern to Another Unit of Length
### Aliases: rescale.ppp
### Keywords: spatial math

### ** Examples

# Bramble Canes data: 1 unit = 9 metres
  data(bramblecanes)
# convert to metres
  bram <- rescale(bramblecanes, 1/9)
# or equivalently
  bram <- rescale(bramblecanes)



