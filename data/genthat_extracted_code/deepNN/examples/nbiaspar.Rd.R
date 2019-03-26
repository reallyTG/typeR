library(deepNN)


### Name: nbiaspar
### Title: nbiaspar function
### Aliases: nbiaspar

### ** Examples


net <- network( dims = c(5,10,2),
                activ=list(ReLU(),softmax()))
nbiaspar(net)




