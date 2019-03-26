library(SpatialTools)


### Name: krige.uk
### Title: Performs universal kriging
### Aliases: krige.uk
### Keywords: kriging universal kriging universal

### ** Examples

# create observed and predicted coordinates
ocoords <- matrix(runif(100), ncol = 2)
pcoords <- matrix(runif(200), ncol = 2)

# include some observed locations in the predicted coordinates
acoords <- rbind(ocoords, pcoords)

# create design matrices
X <- as.matrix(cbind(1, ocoords))
Xa <- as.matrix(cbind(1, acoords))

# create covariance matrix
C3 <- cov.sp(coords = ocoords, sp.type = "matern", sp.par = c(2, 1), smoothness = 1, 
	finescale = 0, error = 0.5, pcoords = acoords)

# set values of regression coefficients
coeff <- matrix(c(1, 2, 3), nrow = 1)

# generate data with error
y <- rmvnorm(nsim = 1, mu = tcrossprod(X, coeff), V = C3$V) + rnorm(50, sd = sqrt(.5))

# use universal kriging to make predictions.  Do not do 
# conditional simulation
krige.obj <- krige.uk(as.vector(y), V = C3$V, Vp = C3$Vp, Vop = C3$Vop, 
	X = X, Xp = Xa, nsim = 0)

#Do kriging with conditional simulation
krige.obj2 <- krige.uk(as.vector(y), V = C3$V, Vp = C3$Vp, Vop = C3$Vop, 
	X = X, Xp = Xa, nsim = 100, 
	Ve.diag = rep(.5, 50), method = "eigen")



