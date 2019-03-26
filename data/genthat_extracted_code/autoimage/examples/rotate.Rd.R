library(autoimage)


### Name: rotate
### Title: Rotate coordinates
### Aliases: rotate

### ** Examples

# coordinates to rotate
coords <- matrix(rnorm(20), ncol = 2)
# rotate coordinates pi/6 radians around the original
rcoords <- rotate(coords, pi/6)
#compare original coordinates to rotated coordinates
par(mfrow = c(1, 2))
plot(coords)
plot(rcoords)



