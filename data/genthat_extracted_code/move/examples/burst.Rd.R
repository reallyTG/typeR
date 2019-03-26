library(move)


### Name: burst
### Title: Bursting a track
### Aliases: burst burst,ANY,character-method burst,Move,factor-method
###   burst,ANY,numeric-method burst,.MoveTrackSingleBurst,missing-method
###   burst,.MoveTrackSingleBurst,factor-method

### ** Examples

data(leroy)
behav <- c(rep(c("B1","B2","B3","B2"),each=200), rep("B1", 118))
testb <- burst(x=leroy, f=behav)
plot(testb, type="l")



