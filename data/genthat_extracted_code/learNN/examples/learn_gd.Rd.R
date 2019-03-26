library(learNN)


### Name: learn_gd
### Title: Learn Gradient Descent
### Aliases: learn_gd

### ** Examples

# input dataset
X = matrix(c(0,0,1,
             0,1,1,
             1,0,1,
             1,1,1), nrow=4, byrow=TRUE)

# output dataset
y = matrix(c(0,
             1,
             1,
             0), nrow=4)

# set parameters
alpha = 0.1
hiddenSize = 32
# also try using:
# alphas = c(0.001,0.01,0.1,1,10,100,1000)
# for (alpha in alphas) {
#   print(paste("Training With Alpha", alpha))
#   learn_gd(X, y, alpha, hiddenSize)         }

# run gradient descent function
learn_gd(X, y, alpha, hiddenSize)



