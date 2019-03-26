library(poker)


### Name: dotTrips
### Title: dotTrips
### Aliases: dotTrips

### ** Examples

cards <- c(14,14,4,5,1,2,1,1,10,9,6,7,2,2,2,2,4,4,4,4,3,3,3,3,8,8,8,8,3,3,3,3)
cards <- c(cards,13,13,13,13,3,3,3,3,14,14,14,14,3,3,3,3,14,14,14,14,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
dotTrips(nPlayers,cards,score)

cards <- c(14,14,4,5,1,2,1,1,2,3,6,7,2,2,2,2,4,4,4,4,3,3,3,3,11,11,11,11,3,3,3,3)
cards <- c(cards,13,13,13,13,3,3,3,3,14,14,14,14,3,3,3,3,14,14,14,14,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
nPlayers <- nrow(cards); nPlayers
dotTrips(nPlayers,cards,score)



