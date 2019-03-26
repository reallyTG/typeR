library(StereoMorph)


### Name: imagePlaneGridTransform
### Title: Performs image perspective transformations to a grid
### Aliases: imagePlaneGridTransform

### ** Examples

## SET GRID PARAMETERS
## THE FIRST 8 NUMBERS ARE CORNERS
## THE LAST 4 NUMBERS ARE TRANSFORMATION PARAMETERS
p <- c(3656, 379, 707, 264, 383, 1034, 3984, 1164, 63.772, -25.211, -0.818, -3.339)

## CREATE TRANSFORMED GRID
grid <- imagePlaneGridTransform(p=p, nx=21, ny=14)

## PLOT GRID
plot(grid)

## MARK CORNERS OF GRID FROM p
points(matrix(p, nrow=4, ncol=2, byrow=TRUE), col='red', lwd=2, cex=1.5)



