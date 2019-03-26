library(deepNN)


### Name: network
### Title: network function
### Aliases: network

### ** Examples


net <- network( dims = c(5,10,2),
                activ=list(ReLU(),softmax()))

net <- network( dims = c(100,50,50,20),
                activ=list(ReLU(),ReLU(),softmax()),
                regulariser=L1_regularisation())




