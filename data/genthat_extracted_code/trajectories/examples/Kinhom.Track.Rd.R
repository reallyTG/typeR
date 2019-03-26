library(trajectories)


### Name: Kinhom.Track
### Title: Inhomogeneous K-function for trajectory pattern
### Aliases: Kinhom.Track
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(spatstat)
X <- list()
for(i in 1:100){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}
Kinhom.Track(X,timestamp = "180 secs")




