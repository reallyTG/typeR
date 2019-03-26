library(heuristica)


### Name: predictPair
### Title: Predict which of a pair of rows has a higher criterion.
### Aliases: predictPair

### ** Examples

##Fit column (5,4) to column (1,0), having validity 1.0, and column (0,1),
## validity 0.
train_matrix <- cbind(y=c(5,4), x1=c(1,0), x2=c(0,1))
singlecue <- singleCueModel(train_matrix, 1, c(2,3))
predictPair(oneRow(train_matrix, 1), oneRow(train_matrix, 2), singlecue)




