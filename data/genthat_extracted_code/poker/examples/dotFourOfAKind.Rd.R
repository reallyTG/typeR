library(poker)


### Name: dotFourOfAKind
### Title: dotFourOfAKind
### Aliases: dotFourOfAKind

### ** Examples

cards <- c(14,10,5,1,2,1,14,9,7,2,2,2,4,4,4,3,3,3,8,8,8,3,3,3,13,13,13)
cards <- c(cards,3,3,3,14,14,14,3,3,3,14,14,14,4,4,4)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
dotFourOfAKind(nPlayers,cards,score)

cards <- c(3,4,5,1,1,1,8,9,10,1,1,1,14,14,14,1,1,1,14,14,14,2,2,2,7,7,7)
cards <- c(cards,3,3,3,14,14,14,3,3,3,14,14,14,4,4,4)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
dotFourOfAKind(nPlayers,cards,score)

cards <- c(3,4,5,1,1,1,8,9,10,1,1,1,14,14,14,1,1,1,14,14,14,2,2,2,11,11,11)
cards <- c(cards,3,3,3,14,14,14,3,3,3,14,14,14,4,4,4)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
dotFourOfAKind(nPlayers,cards,score)



