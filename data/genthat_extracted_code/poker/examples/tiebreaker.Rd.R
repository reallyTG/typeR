library(poker)


### Name: tiebreaker
### Title: tiebreaker
### Aliases: tiebreaker

### ** Examples

cards <- c(2,1,4,2,5,3,6,4,7,1,13,2,14,3,2,3,3,4,5,1,6,2,7,3,13,4,14,1)
cards <- matrix(cards,2,14,byrow=TRUE); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(2,1,3,2,5,3,6,4,7,1,13,2,14,3,2,3,3,4,5,1,6,2,7,3,13,4,14,1)
cards <- matrix(cards,2,14,byrow=TRUE); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(2,3,4,5,1,1,1,1,2,3,6,7,2,2,2,2,4,4,4,4,3,3,3,3,11,11,11,11,3,3,3,3)
cards <- c(cards,13,13,13,13,3,3,3,3,14,14,14,14,3,3,3,3,9,9,9,9,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(2,3,4,5,1,1,1,1,2,3,6,7,2,2,2,2,4,4,4,4,3,3,3,3,11,11,11,11,3,3,3,3)
cards <- c(cards,13,13,13,13,3,3,3,3,14,14,14,14,3,3,3,3,14,14,14,14,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(14,14,4,5,1,2,1,1,10,9,6,7,2,2,2,2,4,4,4,4,3,3,3,3,8,8,8,8,3,3,3,3)
cards <-c(cards,13,13,13,13,3,3,3,3,14,14,14,14,3,3,3,3,14,14,14,14,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(14,14,4,5,1,2,1,1,2,3,6,7,2,2,2,2,4,4,4,4,3,3,3,3,11,11,11,11,3,3,3,3)
cards <-c(cards,13,13,13,13,3,3,3,3,14,14,14,14,3,3,3,3,14,14,14,14,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(7,1,4,2,4,1,4,3,10,1,11,2,2,2,2,3,3,3,3,3,3,1,1,1,5,5,5,4,4,4,6,6,6)
cards <-c(cards,2,2,2,14,14,14,2,2,2)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(2,1,4,2,4,1,4,3,10,1,11,2,2,2,2,3,3,3,3,3,3,1,1,1,5,5,5,4,4,4,6,6,6)
cards <-c(cards,2,2,2,14,14,14,2,2,2)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(2,1,3,3,5,2,6,3,7,3,13,3,14,3,2,3,3,4,5,1,6,3,7,3,13,3,14,3)
cards <- matrix(cards,2,14,byrow=TRUE); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(2,1,3,3,5,3,6,3,7,3,13,3,14,3,2,3,3,4,5,3,6,3,7,3,13,3,14,3)
cards <- matrix(cards,2,14,byrow=TRUE); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(5,10,4,8,1,2,1,1,10,9,6,7,3,2,2,2,5,5,5,5,3,3,3,3,8,8,8,8,3,3,3,3)
cards <-c(cards,14,14,14,14,2,2,2,2,14,14,14,14,3,3,3,3,14,14,14,14,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(5,10,4,8,1,2,1,1,10,9,6,7,3,2,2,2,12,12,12,12,1,1,1,1,12,12,12,12)
cards <-c(cards,3,3,3,3,14,14,14,14,2,2,2,2,14,14,14,14,3,3,3,3,14,14,14,14,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(14,10,5,1,2,1,14,9,7,2,2,2,4,4,4,3,3,3,8,8,8,3,3,3,13,13,13)
cards <-c(cards,3,3,3,14,14,14,3,3,3,14,14,14,4,4,4)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(3,4,5,1,1,1,8,9,10,1,1,1,14,14,14,1,1,1,14,14,14,2,2,2,11,11,11)
cards <-c(cards,3,3,3,14,14,14,3,3,3,14,14,14,4,4,4)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(8,13,5,1,1,4,6,2,2,2,3,4,14,14,14,2,2,2,9,9,9,1,1,1,10,10,10)
cards <-c(cards,1,1,1,11,11,11,1,1,1,12,12,12,1,1,1)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)

cards <- c(1,1,3,4,2,2,3,4,8,8,1,1,9,9,1,1,10,10,1,1,11,11,1,1,12,12,1,1)
cards <- matrix(cards,nrow=2,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
tiebreaker(nPlayers,cards,score)



