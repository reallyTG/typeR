library(trajectories)


### Name: as.Track.arrow
### Title: Convert trajectory pattern to a list of marked point patterns
### Aliases: as.Track.arrow
### Keywords: ~kwd1 ~kwd2

### ** Examples

X <- list()
for(i in 1:10){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}
Y <- as.Track.arrow(X,timestamp="120 secs")



