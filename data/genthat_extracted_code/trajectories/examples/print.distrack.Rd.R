library(trajectories)


### Name: print.distrack
### Title: Methods for class "distrack"
### Aliases: print.distrack
### Keywords: ~kwd1 ~kwd2

### ** Examples

X <- list()
for(i in 1:10){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}

ave <- avedistTrack(X,timestamp = "30 secs")
plot(ave,type="l")



