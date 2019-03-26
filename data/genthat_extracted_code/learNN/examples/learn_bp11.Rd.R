library(learNN)


### Name: learn_bp11
### Title: Learn Back Propagation in 11 lines
### Aliases: learn_bp11

### ** Examples

# construct new data
X = matrix(c(0,0,1,0,1,1,1,0,1,1,1,1), nrow=4, byrow=TRUE)
y = matrix(c(0,1,1,0),nrow=4)

# run 11 lines function
learn_bp11(X, y)

# view output
syn0
syn1



