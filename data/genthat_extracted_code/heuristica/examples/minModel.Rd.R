library(heuristica)


### Name: minModel
### Title: Minimalist Model
### Aliases: minModel

### ** Examples

## Fit column (5,4) to column (1,0), having validity 1.0, and column (0,1),
## validity 0.
train_matrix <- cbind(c(5,4), c(1,0), c(0,1))
min <- minModel(train_matrix, 1, c(2,3))
predictPair(oneRow(train_matrix, 1), oneRow(train_matrix, 2), min)




