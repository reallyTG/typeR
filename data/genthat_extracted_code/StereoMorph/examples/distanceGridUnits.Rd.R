library(StereoMorph)


### Name: distanceGridUnits
### Title: Returns the distances between pairs of points on a square grid
### Aliases: distanceGridUnits
### Keywords: grid functions

### ** Examples

## INDICES OF POINT PAIRS ON A GRID WITH 5 ROWS
pairs <- matrix(c(1,1, 5,10, 6,16, 1,20), nrow=4, ncol=2, byrow=TRUE)

## FIND THE DISTANCE BETWEEN PAIRS OF POINTS IN GRID UNITS
## NOTE LAST DISTANCE IS 5 BECAUSE IT IS A 3,4,5-TRIANGLE
distanceGridUnits(pairs, nx=5)

## FOR ILLUSTRATION, HERE IS A GRID WITH 5 ROWS AND 4 COLUMNS
xy <- cbind(rep(0:4, 4), c(rep(0, 5), rep(1, 5), rep(2, 5), rep(3, 5)))

## PLOT THESE POINTS
plot(xy)

## PLOT LINE SEGMENTS CONNECTING THE PAIRS ABOVE
segments(x0=xy[pairs[, 1], 1], y0=xy[pairs[, 1], 2],
  x1=xy[pairs[, 2], 1], y1=xy[pairs[, 2], 2],
  col=c('blue', 'red', 'purple', 'green'))



