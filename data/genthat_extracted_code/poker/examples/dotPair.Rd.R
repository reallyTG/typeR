library(poker)


### Name: dotPair
### Title: dotPair
### Aliases: dotPair

### ** Examples

cards <- c(2,3,4,1,1,1,2,3,6,2,2,2,4,4,4,3,3,3,11,11,11,3,3,3,13,13,13)
cards <- c(cards,3,3,3,14,14,14,3,3,3,9,9,9,4,4,4)
cards <- matrix(cards,nrow=3,ncol=14)
dotPair(3,cards,c(2,2,2))



