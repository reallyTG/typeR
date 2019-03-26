library(bezier)


### Name: bezierCurveFit
### Title: Fits a Bezier curve to a set of points
### Aliases: bezierCurveFit
### Keywords: bezier curve fitting

### ** Examples

## RUN BEZIER CURVE FIT ON BEZIER CURVE ##
## BEZIER CONTROL POINTS
p <- matrix(c(0,0, 1,4, 2,2, 3,0, 5,5), nrow=5, ncol=2, byrow=TRUE)

## POINTS ON BEZIER
m <- bezier(t=seq(0, 1, length=300), p=p)

## RANDOM VARIATION (NOISE) AROUND POINTS
## SENDING EXACT POINTS WILL ISSUE WARNING IN NLM FUNCTION
mrnorm <- m + cbind(rnorm(nrow(m), 1, 0.1), rnorm(nrow(m), 1, 0.1))

## RESTORE POSITION OF POINTS
mrnorm <- mrnorm - cbind(rep(1, nrow(m)), rep(1, nrow(m)))

## RUN BEZIER CURVE FIT UNCONSTRAINED NUMBER OF CONTROL POINTS
## DEFAULT IS THAT CURVE FIT IS NOT CONSTRAINED TO START AND END POINTS
bfitu <- bezierCurveFit(mrnorm)

## PLOT ORIGINAL BEZIER
plot(m, type="l")

## PLOT POINTS USED IN FITTING
points(mrnorm, col="green", cex=0.25)

## PLOT FIT CURVE
lines(bezier(t=seq(0, 1, length=500), p=bfitu$p), col="red", cex=0.25)



