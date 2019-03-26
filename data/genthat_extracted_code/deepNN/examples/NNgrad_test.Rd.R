library(deepNN)


### Name: NNgrad_test
### Title: NNgrad_test function
### Aliases: NNgrad_test

### ** Examples


net <- network( dims = c(5,10,2),
                activ=list(ReLU(),softmax()))
NNgrad_test(net)




