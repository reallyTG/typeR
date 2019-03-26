library(bezier)


### Name: bezier
### Title: Generates points along a Bezier curve or spline
### Aliases: bezier
### Keywords: bezier curve

### ** Examples

## BEZIER CURVES ##
## SPECIFY PARAMETRIC VALUES FROM 0 TO 1 FOR SAMLPING A BEZIER CURVE
t <- seq(0, 1, length=100)

## BEZIER CONTROL POINTS
p <- matrix(c(0,0,0, 1,4,3, 2,2,0, 3,0,2, 5,5,0), nrow=5, ncol=3, byrow=TRUE)

## CREATE A 1D, 3-POINT BEZIER CURVE
bezier_points <- bezier(t=t, p=p[1:3, 1])

## CREATE THE SAME 1D, 3-POINT BEZIER CURVE, SPECIFYING THE START AND END POINTS SEPARATELY
bezier_points <- bezier(t=t, p=p[2, 1], start=p[1, 1], end=p[3, 1])

## CREATE A 2D, 3-POINT BEZIER CURVE
bezier_points <- bezier(t=t, p=p[1:3, 1:2])

## CREATE A 2D, 5-POINT BEZIER CURVE
bezier_points <- bezier(t=t, p=p[, 1:2])

## PLOT A BEZIER CURVE
## NOTE THAT POINTS ARE NOT EVENLY SPACED ALONG THE CURVE
plot(bezier(t=t, p=p[, 1:2]))

## CREATE A 3D, 3-POINT BEZIER CURVE
bezier_points <- bezier(t=t, p=p[1:3, ])

## CREATE A 3D, 5-POINT BEZIER CURVE
bezier_points <- bezier(t=t, p=p)


## MATRIX VS. LIST INPUT ##
## BEZIER CURVE WITH MATRIX INPUT
p <- matrix(c(0,0,0, 1,4,3, 2,2,0, 3,0,2, 5,5,0), nrow=5, ncol=3, byrow=TRUE)
bezier(t=seq(0, 1, length=10), p=p)

## THE SAME CONTROL POINTS INPUT AS LIST
p <- list(c(0, 1, 2, 3, 5), c(0, 4, 2, 0, 5), c(0, 3, 0, 2, 0))
bezier(t=seq(0, 1, length=10), p=p)


## BEZIER SPLINES ##
## SPECIFY PARAMETRIC VALUES FROM 0 TO 3 FOR SAMLPING A BEZIER SPLINE
t <- seq(0, 3, length=100)

## BEZIER CONTROL POINTS
p <- matrix(c(0,0,0, 1,4,3, 2,2,0, 3,0,2, 5,5,0, 8,0,4, 8,3,7), nrow=7, ncol=3, byrow=TRUE)

## CREATE A 2D BEZIER SPLINE WITH 3, 2-DEGREE BEZIER CURVES
bezier_points <- bezier(t=t, p=p[, 1:2], deg=2)

## PLOT BEZIER SPLINE
plot(bezier_points)

## PLOT FIXED POINTS ALONG SPLINE IN RED
points(rbind(p[1, ], p[3, ], p[5, ], p[7, ]), col="red", cex=0.75)

## CREATE A 3D BEZIER SPLINE WITH 3, 2-DEGREE BEZIER CURVES
bezier_points <- bezier(t=t, p=p, deg=2)


## BEZIER CURVE WITH DIFFERENT DEGREES FOR EACH DIMENSION ##
## LIST OF CONTROL POINTS FOR TWO DIMENSIONS
p_list <- list(c(0, 2, 1, 0), c(0, 4, 2, 0, 5, 0))

## CREATE 2D BEZIER CURVE WITH DIFFERENT NUMBERS OF CONTROL POINTS FOR EACH DIMENSION
bezier(t=seq(0, 1, length=100), p=p_list)



