library(poker)


### Name: dotStraightFlush
### Title: dotStraightFlush
### Aliases: dotStraightFlush

### ** Examples

cards <- c(8,13,5,1,1,4,6,2,2,2,3,4,14,14,14,2,2,2,9,9,9,1,1,1,10,10,10)
cards <- c(cards,1,1,1,11,11,11,1,1,1,12,12,12,1,1,1)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
dotStraightFlush(nPlayers,cards,score)

cards <- c(1,1,3,4,2,2,3,4,8,8,1,1,9,9,1,1,10,10,1,1,11,11,1,1,12,12,1,1)
cards <- matrix(cards,nrow=2,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
dotStraightFlush(nPlayers,cards,score)



