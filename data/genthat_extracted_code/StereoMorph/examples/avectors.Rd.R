library(StereoMorph)


### Name: avectors
### Title: Computes the angle between two vectors
### Aliases: avectors

### ** Examples

## THE ANGLE BETWEEN TWO 2D, ORTHOGONAL VECTORS
## VALUE IS EQUAL TO asin(1/sqrt(2))
u <- c(0, 1)
v <- c(1, 0)
avectors(u, v)

## THE ANGLE BETWEEN TWO 3D VECTORS
## VALUE IS EQUAL TO asin(sqrt(2)/sqrt(3))
u <- c(1, 1, 1)
v <- c(0, 1, 0)
avectors(u, v)



