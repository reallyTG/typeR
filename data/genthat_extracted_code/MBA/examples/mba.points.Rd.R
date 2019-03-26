library(MBA)


### Name: mba.points
### Title: Point approximation from bivariate scattered data using
###   multilevel B-splines
### Aliases: mba.points
### Keywords: dplot smooth

### ** Examples

data(LIDAR)

##split the LIDAR dataset into training and validation sets
tr <- sample(1:nrow(LIDAR),trunc(0.5*nrow(LIDAR)))

##look at how smoothing changes z-approximation,
##careful the number of B-spline surface coefficients
##increases at ~2^h in each direction
for(i in 1:10){
  mba.pts <- mba.points(LIDAR[tr,], LIDAR[-tr,c("x","y")], h=i)$xyz.est
  print(sum(abs(LIDAR[-tr,"z"]-mba.pts[,"z"]))/nrow(mba.pts))
}

## Not run: 
##D ##rgl or scatterplot3d libraries can be fun
##D library(rgl)
##D 
##D ##exaggerate z a bit for effect and take a smaller subset of LIDAR
##D LIDAR[,"z"] <- 10*LIDAR[,"z"]
##D tr <- sample(1:nrow(LIDAR),trunc(0.99*nrow(LIDAR)))
##D 
##D ##get the "true" surface
##D mba.int <- mba.surf(LIDAR[tr,], 100, 100, extend=TRUE)$xyz.est
##D 
##D open3d()
##D surface3d(mba.int$x, mba.int$y, mba.int$z)
##D 
##D ##now the point estimates
##D mba.pts <- mba.points(LIDAR[tr,], LIDAR[-tr,c("x","y")])$xyz.est
##D spheres3d(mba.pts[,"x"], mba.pts[,"y"], mba.pts[,"z"],
##D           radius=5, color="red")
## End(Not run)



