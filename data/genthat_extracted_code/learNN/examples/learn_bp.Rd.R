library(learNN)


### Name: learn_bp
### Title: Learn Back Propagation
### Aliases: learn_bp

### ** Examples

# create data
X = matrix(c(0,0,1,
             0,1,1,
             1,0,1,
             1,1,1), nrow=4, byrow=TRUE)

y = matrix(c(0,
             1,
             1,
             0),
             nrow=4)

# run full function
learn_bp(X, y)



