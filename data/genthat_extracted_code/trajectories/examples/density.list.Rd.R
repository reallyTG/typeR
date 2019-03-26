library(trajectories)


### Name: density.list
### Title: Kernel estimate of intensity of trajectory pattern
### Aliases: density.list
### Keywords: ~kwd1 ~kwd2

### ** Examples

X <- list()
for(i in 1:10){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}
density(X, timestamp = "180 secs")



