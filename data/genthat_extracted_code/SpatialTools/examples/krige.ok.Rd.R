library(SpatialTools)


### Name: krige.ok
### Title: Performs Ordinary Kriging
### Aliases: krige.ok
### Keywords: kriging ordinary kriging ordinary

### ** Examples

# create observed and predicted coordinates
ocoords <- matrix(runif(100), ncol = 2)
pcoords <- matrix(runif(200), ncol = 2)

# include some observed locations in the predicted coordinates
acoords <- rbind(ocoords, pcoords)

# create covariance matrix
C3 <- cov.sp(coords = ocoords, sp.type = "matern", sp.par = c(2, 1), smoothness = 1, 
	finescale = 0, error = 0.5, pcoords = acoords)

# generate data with error
y <- rmvnorm(nsim = 1, mu = rep(2, 50), V = C3$V) + rnorm(50, sd = sqrt(.5))

# use universal kriging to make predictions.  Do not do conditional simulation
krige.obj <- krige.ok(as.vector(y), V = C3$V, Vp = C3$Vp, Vop = C3$Vop, 
	nsim = 0)

#Do conditional simulation
krige.obj2 <- krige.ok(as.vector(y), V = C3$V, Vp = C3$Vp, Vop = C3$Vop, 
	nsim = 100, Ve.diag = rep(.5, 50), method = "eigen")




