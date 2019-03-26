library(MBA)


### Name: mba.surf
### Title: Surface approximation from bivariate scattered data using
###   multilevel B-splines
### Aliases: mba.surf
### Keywords: dplot smooth

### ** Examples

## Not run: 
##D data(LIDAR)
##D 
##D mba.int <- mba.surf(LIDAR, 300, 300, extend=TRUE)$xyz.est
##D 
##D ##Image plot
##D image(mba.int, xaxs="r", yaxs="r")
##D 
##D ##Perspective plot
##D persp(mba.int, theta = 135, phi = 30, col = "green3", scale = FALSE,
##D       ltheta = -120, shade = 0.75, expand = 10, border = NA, box = FALSE)
##D 
##D ##For a good time I recommend using rgl
##D library(rgl)
##D 
##D ex <- 10
##D x <- mba.int[[1]]
##D y <- mba.int[[2]]
##D z <- ex*mba.int[[3]]
##D zlim <- range(z)
##D zlen <- zlim[2] - zlim[1] + 1
##D colorlut <- heat.colors(as.integer(zlen))
##D col <- colorlut[ z-zlim[1]+1 ]
##D 
##D open3d()
##D surface3d(x, y, z, color=col, back="lines")
## End(Not run)



