library(heuristica)


### Name: predictPairProb
### Title: Predict the probablity that row1 has a higher criterion than
###   row2.
### Aliases: predictPairProb

### ** Examples

train_matrix <- cbind(y=c(5,4), x1=c(1,0), x2=c(0,1))
lreg <- logRegModel(train_matrix, 1, c(2,3))
predictPairProb(oneRow(train_matrix, 1), oneRow(train_matrix, 2), lreg)




