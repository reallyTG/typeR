library(deepNN)


### Name: no_regularisation
### Title: no_regularisation function
### Aliases: no_regularisation

### ** Examples


# Example in context: NOTE with the network function
# no_regularisation() is the default, so this argument
# actually need not be included

net <- network( dims = c(784,16,16,10),
                regulariser = no_regularisation(),
                activ=list(ReLU(),logistic(),softmax()))




