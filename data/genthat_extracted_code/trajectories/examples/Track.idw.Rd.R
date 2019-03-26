library(trajectories)


### Name: Track.idw
### Title: Movement smoothing of trajectory pattern
### Aliases: Track.idw
### Keywords: ~kwd1 ~kwd2

### ** Examples

X <- list()
for(i in 1:10){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}
Track.idw(X,timestamp="180 secs")



