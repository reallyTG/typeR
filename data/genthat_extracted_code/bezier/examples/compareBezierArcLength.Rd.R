library(bezier)


### Name: compareBezierArcLength
### Title: Returns difference between input length and a Bezier arc length
### Aliases: compareBezierArcLength
### Keywords: bezier arc length

### ** Examples

## BEZIER CURVE ARC LENGTH COMPARISON ##
## BEZIER CURVE CONTROL POINTS
p <- matrix(c(0,0, 1,4, 2,2), nrow=3, ncol=2, byrow=TRUE)

## COMPARE THE BEZIER ARC LENGTH TO ZERO
## SIMPLY RETURNS ARC LENGTH
compareBezierArcLength(p=p, l=0)

## COMPARE THE BEZIER ARC LENGTH TO ONE
compareBezierArcLength(p=p, l=1)

## SPECIFYING DIFFERENT T PARAMETERS
compareBezierArcLength(p=p, l=1, t1=0.3, t2=0.8)


## BEZIER SPLINE ARC LENGTH COMPARISON ##
## BEZIER SPLINE CONTROL POINTS
p <- matrix(c(0,0, 1,4, 2,2, 3,0, 4,4), nrow=5, ncol=2, byrow=TRUE)

## COMPARE THE BEZIER ARC LENGTH TO ZERO
## SIMPLY RETURNS ARC LENGTH
compareBezierArcLength(p=p, l=0, deg=2)



