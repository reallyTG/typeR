library(poker)


### Name: dotFullHouse
### Title: dotFullHouse
### Aliases: dotFullHouse

### ** Examples

cards <- c(5,10,4,8,1,2,1,1,10,9,6,7,3,2,2,2,5,5,5,5,3,3,3,3,8,8,8,8,3,3,3,3)
cards <- c(cards,14,14,14,14,2,2,2,2,14,14,14,14,3,3,3,3,14,14,14,14,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
dotFullHouse(cards,score)

cards <- c(5,10,4,8,1,2,1,1,10,9,6,7,3,2,2,2,12,12,12,12,1,1,1,1,12,12,12,12,3,3,3,3)
cards <- c(cards,14,14,14,14,2,2,2,2,14,14,14,14,3,3,3,3,14,14,14,14,4,4,4,4)
cards <- matrix(cards,nrow=4,ncol=14); cards
score <- showdown(cards); score
dotFullHouse(cards,score)



