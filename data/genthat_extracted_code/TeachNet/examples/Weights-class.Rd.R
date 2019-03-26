library(TeachNet)


### Name: Weights-class
### Title: Weights objects
### Aliases: Weights-class -,Weights,Weights-method
###   *,numeric,Weights-method +,Weights,Weights-method

### ** Examples


H <- 3 # number of neurons in hidden layer
I <- 6 # number of inputs

random_weights <- new("Weights", alpha = rnorm(1), alpha_h = rnorm(H), w_h = rnorm(H), 
                      w_ih = matrix(nrow=I,ncol=H, data=rnorm(I*H)))




