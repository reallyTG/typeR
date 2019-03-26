library(raster)


### Name: focal
### Title: Focal values
### Aliases: focal focal,RasterLayer-method
### Keywords: spatial

### ** Examples

r <- raster(ncols=36, nrows=18, xmn=0)
r[] <- runif(ncell(r)) 

# 3x3 mean filter
r3 <- focal(r, w=matrix(1/9,nrow=3,ncol=3)) 

# 5x5 mean filter
r5 <- focal(r, w=matrix(1/25,nrow=5,ncol=5)) 

# Gaussian filter
gf <- focalWeight(r, 2, "Gauss")
rg <- focal(r, w=gf)

# The max value for the lower-rigth corner of a 3x3 matrix around a focal cell
f = matrix(c(0,0,0,0,1,1,0,1,1), nrow=3)
f
rm <- focal(r, w=f, fun=max)

# global lon/lat data: no 'edge effect' for the columns
xmin(r) <- -180
r3g <- focal(r, w=matrix(1/9,nrow=3,ncol=3)) 


## Not run: 
##D ## focal can be used to create a cellular automaton
##D 
##D # Conway's Game of Life 
##D w <- matrix(c(1,1,1,1,0,1,1,1,1), nr=3,nc=3)
##D gameOfLife <- function(x) {
##D 	f <- focal(x, w=w, pad=TRUE, padValue=0)
##D 	# cells with less than two or more than three live neighbours die
##D 	x[f<2 | f>3] <- 0
##D 	# cells with three live neighbours become alive
##D 	x[f==3] <- 1
##D 	x
##D }
##D 
##D # simulation function
##D sim <- function(x, fun, n=100, pause=0.25) {
##D 	for (i in 1:n) {
##D 		x <- fun(x)
##D 		plot(x, legend=FALSE, asp=NA, main=i)
##D 		dev.flush()
##D 		Sys.sleep(pause)
##D 	}
##D 	invisible(x)
##D }
##D 
##D # Gosper glider gun
##D m <- matrix(0, nc=48, nr=34)
##D m[c(40, 41, 74, 75, 380, 381, 382, 413, 417, 446, 452, 480, 
##D   486, 517, 549, 553, 584, 585, 586, 619, 718, 719, 720, 752, 
##D   753, 754, 785, 789, 852, 853, 857, 858, 1194, 1195, 1228, 1229)] <- 1
##D init <- raster(m)
##D 
##D # run the model
##D sim(init, gameOfLife, n=150, pause=0.05)
## End(Not run)



