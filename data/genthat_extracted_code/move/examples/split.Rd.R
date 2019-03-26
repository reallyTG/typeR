library(move)


### Name: split
### Title: Splitting a MoveStack, MoveBurst or DBBMMStack
### Aliases: split split,MoveStack,missing-method
###   split,.MoveTrackSingleBurst,missing-method
###   split,.MoveTrackStack,missing-method split,DBBMMStack,missing-method
###   split,.UDStack,missing-method

### ** Examples

## splitting a MoveStack
data(fishers)
split(fishers)

## splitting a DBBMMStack
data(dbbmmstack)
split(dbbmmstack)

## splitting a MoveBurst
data(leroy)
behav <- c(rep(c("a","b","c","a"),each=200), rep("b", 118))
leroyBurst <- burst(x=leroy, f=behav)
split(leroyBurst)



