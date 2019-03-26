library(move)


### Name: corridor
### Title: Corridor behavior identification
### Aliases: corridor corridor,.MoveTrackSingle-method
###   corridor,.MoveTrackStack-method

### ** Examples

## with a move object 
  data(leroy)  
  tmp <- corridor(leroy, plot=TRUE)
  plot(tmp, type="l", col=c("red","black")[c(tmp@burstId,NA)])
  
## with a moveStack object   
  data(fishers)
  stacktmp <- corridor(fishers[c(1:400,sum(n.locs(fishers))-(400:1)),])
  plot(stacktmp[[2]], col=c("red","black")[stacktmp[[2]]@burstId])
  lines(stacktmp[[2]], col=c("red","black")[c(stacktmp[[2]]@burstId,NA)])



