library(StereoMorph)


### Name: distancePointToLine
### Title: Finds the minimum distance(s) between point(s) and a line
### Aliases: distancePointToLine
### Keywords: lines

### ** Examples

## FIND THE DISTANCE BETWEEN A 2D POINT AND A LINE DEFINED BY A SLOPE AND Y-INTERCEPT
distancePointToLine(p=c(0, 2), l1=list(m=0, b=1))

## FIND THE DISTANCE BETWEEN A 2D POINT AND A LINE DEFINED BY TWO POINTS ON THE LINE
distancePointToLine(p=c(0, 5), l1=list(l1=c(2, 4), l2=c(2, 1)))

## FIND THE DISTANCE BETWEEN MULTIPLE 2D POINTS AND A LINE DEFINED BY A SLOPE AND Y-INTERCEPT
p <- matrix(c(0, 0, 1, 1, 2, 2), nrow=3, ncol=2, byrow=TRUE)
distancePointToLine(p=p, l1=list(m=0, b=1))

## FIND THE DISTANCE BETWEEN MULTIPLE 2D POINTS AND A LINE DEFINED BY DIRECTION NUMBERS
p <- matrix(c(0, -1.5, 1, -2, 2, 2), nrow=3, ncol=2, byrow=TRUE)
distancePointToLine(p=p, l1=list(a=1, b=2, c=3))

## FIND THE DISTANCE BETWEEN A 3D POINT AND A LINE DEFINED BY TWO POINTS ON THE LINE
## HERE THE DISTANCE IS EQUAL TO sqrt(2)
distancePointToLine(p=c(1, 1, 1), l1=c(0, 0, 0), l2=c(1, 0, 0))

## FIND THE DISTANCE BETWEEN MULTIPLE 3D POINTS AND A LINE DEFINED BY TWO POINTS ON THE LINE
p <- matrix(c(0, 0, 0, 1, 1, 1, 2, 2, 2), nrow=3, ncol=3, byrow=TRUE)
distancePointToLine(p=p, l1=list(l1=c(0, 0, 0), l2=c(1, 0, 0)))



