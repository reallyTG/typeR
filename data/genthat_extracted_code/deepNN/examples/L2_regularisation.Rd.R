library(deepNN)


### Name: L2_regularisation
### Title: L2_regularisation function
### Aliases: L2_regularisation

### ** Examples


# Example in context: NOTE the value of 1 used here is arbitrary,
# to get this to work well, you'll have to experiment.

net <- network( dims = c(784,16,16,10),
                regulariser = L2_regularisation(1),
                activ=list(ReLU(),logistic(),softmax()))




