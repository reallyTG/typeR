library(trajectories)


### Name: pcfinhom.Track
### Title: Pair correlation funcrion of trajectory pattern
### Aliases: pcfinhom.Track
### Keywords: ~kwd1 ~kwd2

### ** Examples

X <- list()
for(i in 1:100){
  m <- matrix(c(0,10,0,10),nrow=2,byrow = TRUE)
  X[[i]] <- rTrack(bbox = m,transform = TRUE)
}
g <- pcfinhom.Track(X,timestamp = "180 sec")
plot(g)



