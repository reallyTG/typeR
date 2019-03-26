library(deepNN)


### Name: logistic
### Title: logistic function
### Aliases: logistic

### ** Examples


# Example in context

net <- network( dims = c(100,50,20,2),
                activ=list(logistic(),ReLU(),softmax()))




