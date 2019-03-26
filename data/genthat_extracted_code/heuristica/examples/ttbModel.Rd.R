library(heuristica)


### Name: ttbModel
### Title: Take The Best
### Aliases: ttbModel

### ** Examples

# Fit column 1 (y) to columns 2 and 3 (x1 and x2) of train_matrix.
train_matrix <- cbind(y=c(5,4), x1=c(1,0), x2=c(0,0))
ttb <- ttbModel(train_matrix, 1, c(2,3))
# Have ttb predict whether row 1 or 2 has a greater value for y.  The
# output is 1, meaning it predicts row1 is bigger.
predictPair(oneRow(train_matrix, 1), oneRow(train_matrix, 2), ttb)

# Now ask it the reverse-- predict whther row 2 or row 1 is greater.  The
# output is -1, meaning it still predicts row1 is bigger.  (It is a
# symmetric heuristic.)
predictPair(oneRow(train_matrix, 2), oneRow(train_matrix, 1), ttb)

# But this test data results in an incorrect prediction-- that row1 has a
# smaller criterion than row2-- because x1 has a reversed direction.
test_matrix <- cbind(y=c(5,4), x1=c(0,1), x2=c(0,0))
predictPair(oneRow(test_matrix, 1), oneRow(test_matrix, 2), ttb)




