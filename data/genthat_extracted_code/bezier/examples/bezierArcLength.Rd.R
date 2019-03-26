library(bezier)


### Name: bezierArcLength
### Title: Approximates the arc length of a Bezier curve or spline
### Aliases: bezierArcLength
### Keywords: bezier arc length

### ** Examples

## BEZIER CURVE ARC LENGTH ##
## BEZIER CURVE CONTROL POINTS
p <- matrix(c(0,0, 1,4, 2,2), nrow=3, ncol=2, byrow=TRUE)

## FIND THE ARC LENGTH ALONG THE BEZIER CURVE
bezierArcLength(p=p, t1=0, t2=1)

## FIND THE ARC LENGTH ALONG THE BEZIER CURVE
## HERE WE FIND THE ARC LENGTH OVER A SUBSET OF A BEZIER CURVE
bezierArcLength(p=p, t1=0.3, t2=0.8)


## BEZIER SPLINE ARC LENGTH ##
## BEZIER SPLINE CONTROL POINTS
p <- matrix(c(0,0, 1,4, 2,2, 3,0, 4,4), nrow=5, ncol=2, byrow=TRUE)

## FIND THE ARC LENGTH ALONG THE BEZIER SPLINE
## HERE t2 = 1 SO ARC LENGTH IS ONLY CALCULATED FOR THE
##   FIRST BEZIER CURVE OF THE SPLINE
bezierArcLength(p=p, t1=0, t2=1, deg=2)

## HERE t2 = 2 SO ARC LENGTH IS CALCULATED FOR BOTH THE
##   THE FIRST AND SECOND BEZIER CURVES
## SINCE THE TWO CURVES IN THE SPLINE ARE THE SAME -
##   JUST IN DIFFERENT ORIENTATIONS, THE ARC LENGTH
##   IS EXACTLY DOUBLE THE PREVIOUS ARC LENGTH
bezierArcLength(p=p, t1=0, t2=2, deg=2)


## COMPARE CONVERGENCE ##
## BEZIER SPLINE CONTROL POINTS
p <- matrix(c(0,0, 1,4, 2,2), nrow=3, ncol=2, byrow=TRUE)

## FIND ARC LENGTH BY ESTIMATION
bconv <- bezierArcLength(p=p, t1=0, t2=1)

## FIND ARC LENGTH WITH DIFFERENT NUMBERS OF POINTS
b1000 <- bezierArcLength(p=p, t1=0, t2=1, n=1000)
b10000 <- bezierArcLength(p=p, t1=0, t2=1, n=10000)
b100000 <- bezierArcLength(p=p, t1=0, t2=1, n=100000)

## COMPARE RESULTS
## ESTIMATION DIFFERS FROM 1000 PT SUM BY 0.0001311936
b1000$arc.length - bconv$arc.length

## ESTIMATION DIFFERS FROM 10000 PT SUM BY 0.0001321184
b10000$arc.length - bconv$arc.length

## ESTIMATION DIFFERS FROM 100000 PT SUM BY 0.0001321277
b100000$arc.length - bconv$arc.length



