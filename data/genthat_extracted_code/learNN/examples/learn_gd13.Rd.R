library(learNN)


### Name: learn_gd13
### Title: Learn Gradient Descent in 13 lines
### Aliases: learn_gd13

### ** Examples

# create new data
alpha = 0.5
hidden_dim = 4
X = matrix(c(0,0,1,0,1,1,1,0,1,1,1,1), nrow=4, byrow=TRUE)
y = matrix(c(0,1,1,0),nrow=4)

# run 13 lines function
learn_gd13(X, y, alpha, hidden_dim)



