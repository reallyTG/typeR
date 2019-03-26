library(trajectories)


### Name: chimaps
### Title: Chimaps of tarjectory pattern.
### Aliases: chimaps
### Keywords: ~kwd1 ~kwd2

### ** Examples

X <- list()
for(i in 1:10){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}
chimaps(X, timestamp = "180 secs",rank = 2)



