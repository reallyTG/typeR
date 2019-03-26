library(bezier)


### Name: summary.bezierArcLength
### Title: Summary of a Bezier arc length estimation
### Aliases: summary.bezierArcLength print.summary.bezierArcLength
### Keywords: bezier arc length

### ** Examples

## BEZIER CURVE ARC LENGTH ESTIMATION ##
## BEZIER CURVE CONTROL POINTS
p <- matrix(c(0,0, 1,4, 2,2), nrow=3, ncol=2, byrow=TRUE)

## FIND THE ARC LENGTH ALONG THE BEZIER CURVE
bcurve <- bezierArcLength(p=p, t1=0, t2=1)

## PRINT SUMMARY
print(summary(bcurve))


## BEZIER SPLINE ARC LENGTH ##
## BEZIER SPLINE CONTROL POINTS
p <- matrix(c(0,0, 1,4, 2,2, 3,0, 4,4), nrow=5, ncol=2, byrow=TRUE)

## FIND THE ARC LENGTH ALONG THE BEZIER SPLINE
## HERE t2 = 1 SO ARC LENGTH IS ONLY CALCULATED FOR THE
##   FIRST BEZIER CURVE OF THE SPLINE
bspline <- bezierArcLength(p=p, t1=0, t2=2, deg=2)

## PRINT SUMMARY
print(summary(bspline))



