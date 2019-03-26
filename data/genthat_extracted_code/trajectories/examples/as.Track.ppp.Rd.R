library(trajectories)


### Name: as.Track.ppp
### Title: Conver trajectory pattern to a list of objects of class ppp
### Aliases: as.Track.ppp
### Keywords: ~kwd1 ~kwd2

### ** Examples

X <- list()
for(i in 1:10){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}
Y <- as.Track.ppp(X,timestamp="120 secs")



