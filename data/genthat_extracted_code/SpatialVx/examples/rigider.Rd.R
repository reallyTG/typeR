library(SpatialVx)


### Name: rigider
### Title: Rigid Transformation
### Aliases: rigider plot.rigided print.rigided summary.rigided
###   rigidTransform
### Keywords: manip

### ** Examples


# Simple uninteresting example for the R robots.
x <- y <- matrix(0, 20, 40)

x[ 12:18, 2:3 ] <- 1

y[ 13:19, 5:6 ] <- 1

xycoords <- cbind(rep(1:20, 40), rep(1:40, each = 20))

tmp <- rigider(x1 = x, x0 = y, p0 = xycoords)
tmp
plot(tmp)

# Rotate a coordinate system.
data( "geom000" )

loc <- cbind(rep(1:601, 501), rep(1:501, each = 601))

# Rotate the coordinates by pi / 4.
th <- c(0, 0, pi / 4)
names(th) <- c("x", "y", "rotation")
cen <- colMeans(loc[ geom000 > 0, ])
loc2 <- rigidTransform(theta = th, p0 = loc, cen = cen)

geom101 <- Fint2d(X = geom000, Ws = loc2, s = loc, method = "round")

## Not run: 
##D 
##D image.plot(geom101)
##D 
##D # Try to find the optimal rigid transformation.
##D # First, allow a translation as well as rotation.
##D 
##D tmp <- rigider(x1 = geom101, x0 = geom000, p0 = loc,
##D     rotate = TRUE, verbose = TRUE)
##D tmp
##D plot(tmp)
##D 
##D # Now, only allow rotation, which does not work as
##D # well as one would hope.
##D tmp <- rigider(x1 = geom101, x0 = geom000, p0 = loc,
##D     translate = FALSE, rotate = TRUE, verbose = TRUE)
##D tmp
##D plot(tmp)
##D 
##D # Using correlation.
##D tmp <- rigider(x1 = geom101, x0 = geom000, p0 = loc,
##D     rotate = TRUE, loss = "QcorrRigid", verbose = TRUE)
##D tmp
##D summary(tmp)
##D plot(tmp)
##D 
##D ##
##D ## Examples from ICP phase 1.
##D ##
##D ## Geometric cases.
##D ##
##D 
##D data( "geom001" )
##D data( "geom002" )
##D data( "geom003" )
##D data( "geom004" )
##D data( "geom005" )
##D 
##D 
##D tmp <- rigider(x1 = geom001, x0 = geom000, p0 = loc, verbose = TRUE)
##D tmp
##D plot(tmp)
##D 
##D tmp <- rigider(x1 = geom002, x0 = geom000, p0 = loc, verbose = TRUE)
##D tmp
##D plot(tmp)
##D 
##D tmp <- rigider(x1 = geom003, x0 = geom000, p0 = loc, verbose = TRUE)
##D tmp
##D plot(tmp)
##D 
##D tmp <- rigider(x1 = geom004, x0 = geom000, p0 = loc, verbose = TRUE)
##D tmp
##D plot(tmp)
##D 
##D # Note: Above is a scale error rather than a rotation, but can we
##D # approximate it with a rotation?
##D tmp <- rigider(x1 = geom004, x0 = geom000, p0 = loc, rotate = TRUE,
##D     verbose = TRUE)
##D tmp
##D plot(tmp)
##D # Ok, maybe need to give it better starting values?  Or, run it again
##D # with just the translation.
##D 
##D tmp <- rigider(x1 = geom005, x0 = geom000, p0 = loc, verbose = TRUE)
##D tmp
##D plot(tmp)
##D 
##D 
## End(Not run)



