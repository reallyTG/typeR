library(StereoMorph)


### Name: distancePointToPoint
### Title: Finds the distance between two points or sets of points
### Aliases: distancePointToPoint

### ** Examples


## FIND THE DISTANCE BETWEEN TWO, 2D POINTS
## VALUE IS sqrt(2)
distancePointToPoint(p1=c(0, 0), p2=c(1, 1))

## FIND THE DISTANCE BETWEEN A 2D POINT AND MULTIPLE 2D POINTS
p1 <- c(0, 0)
p2 <- matrix(c(1, 1, 2, 2, 3, 3), nrow=3, ncol=2, byrow=TRUE)
distancePointToPoint(p1=p1, p2=p2)

## FIND THE DISTANCE BETWEEN TWO SETS OF 2D POINTS
p1 <- matrix(c(0, 0, 1, 1, 2, 2), nrow=3, ncol=2, byrow=TRUE)
p2 <- matrix(c(1, 1, 2, 2, 3, 3), nrow=3, ncol=2, byrow=TRUE)
distancePointToPoint(p1=p1, p2=p2)

## FIND THE DISTANCE BETWEEN A 3D POINT AND MULTIPLE 3D POINTS
p1 <- c(0, 0, 0)
p2 <- matrix(c(1, 1, 1, 2, 2, 2, 3, 3, 3), nrow=3, ncol=3, byrow=TRUE)
distancePointToPoint(p1=p1, p2=p2)

## FIND THE DISTANCE BETWEEN CONSECUTIVE VALUES IN A VECTOR
distancePointToPoint(p1=c(1, 2, 4, 7))

## FIND THE DISTANCE BETWEEN CONSECUTIVE 2D POINTS IN A MATRIX
## HERE, WE FIND THE DISTANCE BETWEEN THE POINT c(0, 0) AND c(1, 1), WHICH IS sqrt(2)
distancePointToPoint(p1=matrix(c(0, 0, 1, 1), nrow=2, ncol=2, byrow=TRUE))

## FIND THE DISTANCE BETWEEN CONSECUTIVE 2D POINTS IN A MATRIX, WITH MORE POINTS
## HERE, WE ADD TWO MORE POINTS TO THE PREVIOUS EXAMPLE: c(2, 2) AND c(3, 3)
## THE DISTANCE BETWEEN EACH CONSECUTIVE PAIR OF POINTS IS sqrt(2)
distancePointToPoint(p1=matrix(c(0, 0, 1, 1, 2, 2, 3, 3), nrow=4, ncol=2, byrow=TRUE))

## FIND THE DISTANCE BETWEEN CONSECUTIVE 3D POINTS IN A MATRIX
distancePointToPoint(p1=matrix(c(0, 0, 0, 1, 1, 1), nrow=2, ncol=3, byrow=TRUE))

## FIND THE DISTANCE BETWEEN CONSECUTIVE 4D POINTS IN A MATRIX
distancePointToPoint(p1=matrix(c(0, 0, 0, 0, 1, 1, 1, 1), nrow=2, ncol=4, byrow=TRUE))



