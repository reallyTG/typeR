library(astrochron)


### Name: mwin
### Title: Determine 'dynamic moving window' for stratigraphic series,
###   adjusting for changing sample density to maintain a window of
###   constant duration
### Aliases: mwin

### ** Examples

# generate some noise
ex1 <- ar1(npts=50,dt=1)

# jitter sampling times
ex1[1]=ex1[1]+rnorm(50,sd=3)
# sort 
ex1 = ex1[order(ex1[1],na.last=NA,decreasing=FALSE),]

# run mwin
mwin(ex1,win=10)



