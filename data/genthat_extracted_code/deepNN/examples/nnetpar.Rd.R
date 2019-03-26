library(deepNN)


### Name: nnetpar
### Title: nnetpar function
### Aliases: nnetpar

### ** Examples


net <- network( dims = c(5,10,2),
                activ=list(ReLU(),softmax()))
nnetpar(net)




