library(trajectories)


### Name: avedistTrack
### Title: Average pairwise distance of trajectory pattern over time
### Aliases: avedistTrack
### Keywords: ~kwd1 ~kwd2

### ** Examples

X <- list()
for(i in 1:10){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}

ave <- avedistTrack(X,timestamp = "120 secs")
plot(ave,type="l")





