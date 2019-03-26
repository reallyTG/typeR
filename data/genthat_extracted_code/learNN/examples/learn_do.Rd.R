library(learNN)


### Name: learn_do
### Title: Learn Dropout
### Aliases: learn_do

### ** Examples

# construct data
X = matrix(c(0,0,1,0,1,1,1,0,1,1,1,1), nrow=4, byrow=TRUE)
y = matrix(c(0,1,1,0),nrow=4)

# set hyperparameters
alpha = 0.5
hidden_dim = 4
dropout_percent = 0.2
do_dropout = TRUE

# run 11 lines function
learn_do(X, y, alpha, hidden_dim, dropout_percent, TRUE)

# view output
synapse_0
synapse_1



