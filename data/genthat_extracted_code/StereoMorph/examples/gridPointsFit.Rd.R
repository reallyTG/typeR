library(StereoMorph)


### Name: gridPointsFit
### Title: Fits regularly spaced points to a sample line or grid
### Aliases: gridPointsFit

### ** Examples


## ESTIMATE LINE INTER-POINT INTERVAL
# GENERATE POINTS AT A REGULAR INTERVAL WITH NORMAL, RANDOM VARIATION
pts <- cbind((1:500) + rnorm(500, sd=1), (1:500) + rnorm(500, sd=1))

# FIND THE MEAN SUCCESSIVE POINT-TO-DISTANCE
# NOTE THAT THIS CONSISTENTLY OVERESTIMATES THE TRUE INTERVAL
mean(sqrt(rowSums((pts[2:nrow(pts), ] - pts[1:(nrow(pts)-1), ])^2)))

# FIT A REGULARLY SPACED POINTS MODEL TO EACH DIMENSION OF THE POINTS MATRIX
fit_x <- nlminb(start=c(pts[1, 1], pts[2, 1]-pts[1, 1]), 
    objective=gridPointsFitError, nx=nrow(pts), points=pts[, 1])
fit_y <- nlminb(start=c(pts[1, 2], pts[2, 2]-pts[1, 2]), 
    objective=gridPointsFitError, nx=nrow(pts), points=pts[, 2])

# FIND THE BEST FIT INTER-POINT DISTANCE
# MORE ACCURATELY RECOVERS TRUE INTERVAL
sqrt(fit_x$par[2]^2 + fit_y$par[2]^2)


## ESTIMATE REGULAR GRID SQUARE SIZE
# GENERATE A REGULAR GRID WITH NORMAL, RANDOM VARIATION
corners <- cbind(
    rep(1:20, 20) + rnorm(20^2, sd=0.1), 
    c(t(matrix(1:20, nrow=20, ncol=20))) + rnorm(20^2, sd=0.1))

# FIT A REGULARLY SPACED POINTS MODEL TO EACH DIMENSION OF THE POINTS MATRIX
fit_x <- nlminb(
    start=c(corners[1, 1], corners[2, 1]-corners[1, 1], 0),
    objective=gridPointsFitError, points=corners[, 1], nx=20, ny=20)
fit_y <- nlminb(
    start=c(corners[1, 2], corners[2, 2]-corners[1, 2], 0),
    objective=gridPointsFitError, points=corners[, 2], nx=20, ny=20)

# FIND THE BEST FIT INTER-POINT DISTANCE (SQUARE SIZE)
sqrt(fit_x$par[2]^2 + fit_y$par[2]^2)



