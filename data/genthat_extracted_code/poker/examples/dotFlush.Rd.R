library(poker)


### Name: dotFlush
### Title: dotFlush
### Aliases: dotFlush

### ** Examples

cards <- c(2,1,3,3,5,2,6,3,7,3,13,3,14,3,2,3,3,4,5,1,6,3,7,3,13,3,14,3)
cards <- matrix(cards,2,14,byrow=TRUE); cards
score <- showdown(cards); score
dotFlush(cards,score)

cards <- c(2,1,3,3,5,3,6,3,7,3,13,3,14,3,2,3,3,4,5,3,6,3,7,3,13,3,14,3)
cards <- matrix(cards,2,14,byrow=TRUE);cards
score <- showdown(cards); score 
dotFlush(cards,score)



