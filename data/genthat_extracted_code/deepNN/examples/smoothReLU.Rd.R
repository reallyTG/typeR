library(deepNN)


### Name: smoothReLU
### Title: smoothReLU function
### Aliases: smoothReLU

### ** Examples


# Example in context

net <- network( dims = c(100,50,20,2),
                activ=list(smoothReLU(),ReLU(),softmax()))




