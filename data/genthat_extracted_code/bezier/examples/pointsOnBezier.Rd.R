library(bezier)


### Name: pointsOnBezier
### Title: Generates points along a Bezier curve or spline
### Aliases: pointsOnBezier
### Keywords: bezier arc length

### ** Examples

## EVENLY_SPACED METHOD ##
## BEZIER CURVE CONTROL POINTS
p <- matrix(c(3,2, 3,0, 5,5), nrow=3, ncol=2, byrow=TRUE)

## GET PARAMETRIC BEZIER POINTS
bp <- bezier(t=seq(0, 1, length=100), p=p)

## GET EVENLY SPACED POINTS ALONG CURVE
pob <- pointsOnBezier(p=p, n=10, method="evenly_spaced", print.progress=TRUE)

## FUNCTION WILL RUN FASTER BY INCREASING CONVERGENCE CRITERIA
pob_faster <- pointsOnBezier(p=p, n=10, method="evenly_spaced", sub.relative.min.slope=1e-2, 
	print.progress=TRUE)

## PLOT PARAMETRIC BEZIER POINTS
## NOTE THAT THEY ARE NOT EVENLY SPACED ALONG THE CURVE
plot(bp, cex=0.5, asp=1)

## ADD POINTS TO PLOT
## NOTE THAT THESE POINTS ARE EVENLY SPACED ALONG CURVE
points(pob$points, col="red")

## WITH FASTER RUN, SOME DEVIATION BUT POINTS ARE NEARLY IDENTICAL
points(pob_faster$points, col="blue", cex=1.5)


## MAX_DIST METHOD ##
## BEZIER CURVE CONTROL POINTS
p <- matrix(c(3,2, 3,0, 5,5), nrow=3, ncol=2, byrow=TRUE)

## GET PARAMETRIC BEZIER POINTS
bp <- bezier(t=seq(0, 1, length=100), p=p)

## GET POINTS ALONG CURVE WITH INTERPOINT DISTANCE LESS THAN 0.1
pob <- pointsOnBezier(p=p, max.dist=0.1, method="max_dist", print.progress=TRUE)

## PLOT PARAMETRIC BEZIER POINTS
plot(bp, cex=0.5, asp=1)

## ADD POINTS TO PLOT
points(pob$points, col="red")


## ADJOINING METHOD ##
## BEZIER CURVE CONTROL POINTS
p <- matrix(c(300,200, 300,0, 500,500), nrow=3, ncol=2, byrow=TRUE)

## GET PARAMETRIC BEZIER POINTS
bp <- bezier(t=seq(0, 1, length=100), p=p)

## GET POINTS ALONG CURVE WITH ROUNDED POSITIONS AT "PIXEL" SPACING
pob <- pointsOnBezier(p=p, method="adjoining", print.progress=TRUE)

## PLOT PARAMETRIC BEZIER POINTS
plot(bp, cex=0.5, asp=1)

## ADD POINTS TO PLOT
points(pob$points, col="red", cex=0.2, pch=16)



