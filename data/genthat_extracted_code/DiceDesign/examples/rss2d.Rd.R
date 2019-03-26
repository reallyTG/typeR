library(DiceDesign)


### Name: rss2d
### Title: 2D graphical tool for defect detection of Space-Filling Designs.
### Aliases: rss2d
### Keywords: design

### ** Examples

# Detection of defects of Sobol designs

# requires randtoolbox package
library(randtoolbox)

	# in 2D
rss <- rss2d(design=sobol(n=20, dim=2), lower=c(0,0), upper=c(1,1), type="l", 
   col="red")

	# in 8D. 
	# All pairs of dimensions are tried to detect the worst defect 
	# (according to the specified goodness-of-fit statistic).
d <- 8
n <- 10*d
rss <- rss2d(design=sobol(n=n, dim=d), lower=rep(0,d), upper=rep(1,d), type="l", 
   col="red")

# avoid this defect with scrambling ?
#    1. Faure-Tezuka scrambling (type "?sobol" for more details and options)
rss <- rss2d(design=sobol(n=n, dim=d, scrambling=2), lower=rep(0,d), 
   upper=rep(1,d), type="l", col="red")
#    2. Owen scrambling
rss <- rss2d(design=sobol(n=n, dim=d, scrambling=1), lower=rep(0,d), 
   upper=rep(1,d), type="l", col="red")



