library(poker)


### Name: dotStraight
### Title: dotStraight
### Aliases: dotStraight

### ** Examples

cards <- c(7,1,4,2,4,1,4,3,10,1,11,2,2,2,2,3,3,3,3,3,3,1,1,1,5,5,5)
cards <- c(cards,4,4,4,6,6,6,2,2,2,14,14,14,2,2,2)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
dotStraight(cards, score)

cards <- c(2,1,4,2,4,1,4,3,10,1,11,2,2,2,2,3,3,3,3,3,3,1,1,1,5,5,5)
cards <- c(cards,4,4,4,6,6,6,2,2,2,14,14,14,2,2,2)
cards <- matrix(cards,nrow=3,ncol=14); cards
score <- showdown(cards); score
dotStraight(cards, score)



