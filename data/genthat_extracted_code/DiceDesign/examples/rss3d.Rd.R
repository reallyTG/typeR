library(DiceDesign)


### Name: rss3d
### Title: 3D graphical tool for defect detection of Space-Filling Designs.
### Aliases: rss3d
### Keywords: design

### ** Examples

	# An orthogonal array in 3D   
data(OA131)

	# centering the design points of this 7-levels design
OA <- (OA131 + 0.5)/7

	# 2D projections onto coordinate axis 
pairs(OA, xlim=c(0,1), ylim=c(0,1))
	# Now let us look at the 3D properties with the 3D RSS (requires the rgl package)
rss <- rss3d(OA, lower=c(0,0,0), upper=c(1,1,1))
	# The worst direction detected is nearly proportional to (2,-1,2)
	# (type "?OA131" for explanations about this linear orthogonal array)
print(rss$worst.dir)

# Now, scramble this design
# X <- (OA131 + matrix(runif(49*3, 49, 3)))/7
# or load the design obtained this way
data(OA131_scrambled)
OA2 <- OA131_scrambled

# no feature is detected by the 2D RSS:
rss <- rss2d(OA2, lower=c(0,0,0), upper=c(1,1,1))    
# 4 clusters are detected by the 3D RSS:
rss <- rss3d(OA2, lower=c(0,0,0), upper=c(1,1,1))	

	
	# Defect detection of 8D Sobol sequences
	# All triplets of dimensions are tried to detect the worst defect 
	# (according to the specified goodness-of-fit statistic).
	# requires randtoolbox library to generate the Sobol sequence
## Not run: 
##D library(randtoolbox)
##D d <- 8
##D n <- 10*d
##D rss <- rss3d(design=sobol(n=n, dim=d), lower=rep(0,d), upper=rep(1,d))
## End(Not run)



