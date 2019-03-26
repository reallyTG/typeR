library(trajectories)


### Name: avemove
### Title: Average movement of trajectory pattern
### Aliases: avemove
### Keywords: ~kwd1 ~kwd2

### ** Examples

X <- list()
for(i in 1:10){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}
avemove(X,timestamp = "30 secs")



