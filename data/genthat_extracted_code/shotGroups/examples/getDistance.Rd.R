library(shotGroups)


### Name: getDistance
### Title: Get distance based on absolute and angular size
### Aliases: getDistance

### ** Examples

size <- seq(1, 20, by=5)   # inch
dst  <- 100                # yard

# get angular size in MOA from absolute size
angular <- getMOA(size, dst=dst, conversion='yd2in', type='MOA')

# this should return dst throughout
getDistance(size, angular=angular, conversion='yd2in', type='MOA')



