library(unmarked)


### Name: formatDistData
### Title: Bin distance data
### Aliases: formatDistData

### ** Examples

# Create a data.frame containing distances of animals detected
# along 4 transects.
dat <- data.frame(transect=gl(4,5, labels=letters[1:4]),
                  distance=rpois(20, 10))
dat

# Look at your transect names.
levels(dat$transect)

# Suppose that you also surveyed a transect named "e" where no animals were
# detected. You must add it to the levels of dat$transect
levels(dat$transect) <- c(levels(dat$transect), "e")
levels(dat$transect)

# Distance cut points defining distance intervals
cp <- c(0, 8, 10, 12, 14, 18)

# Create formated response matrix
yDat <- formatDistData(dat, "distance", "transect", cp)
yDat

# Now you could merge yDat with transect-level covariates and
# then use unmarkedFrameDS to prepare data for distsamp


## Example for data from multiple occasions

dat2 <- data.frame(distance=1:100, site=gl(5, 20),
                   visit=factor(rep(1:4, each=5)))
cutpt <- seq(0, 100, by=25)
y2 <- formatDistData(dat2, "distance", "site", cutpt, "visit")
umf <- unmarkedFrameGDS(y=y2, numPrimary=4, survey="point",
                        dist.breaks=cutpt, unitsIn="m")
 ## Example for datda from multiple occasions with effortMatrix
 
 dat3 <-  data.frame(distance=1:100, site=gl(5, 20), visit=factor(rep(1:4, each=5)))
 cutpt <- seq(0, 100, by=25)
 
 effortMatrix <- matrix(ncol=4, nrow=5, rbinom(20,1,0.8))
 
 y3 <- formatDistData(dat2, "distance", "site", cutpt, "visit", effortMatrix)
 


