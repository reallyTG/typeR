library(deepNN)


### Name: L1_regularisation
### Title: L1_regularisation function
### Aliases: L1_regularisation

### ** Examples


# Example in context: NOTE the value of 1 used here is arbitrary,
# to get this to work well, you'll have to experiment.

net <- network( dims = c(784,16,16,10),
                regulariser = L1_regularisation(1),
                activ=list(ReLU(),logistic(),softmax()))




