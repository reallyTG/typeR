library(TeachNet)


### Name: Weights2-class
### Title: Weights2 objects
### Aliases: Weights2-class -,Weights2,Weights2-method
###   *,numeric,Weights2-method +,Weights2,Weights2-method

### ** Examples


M <- 3 # number of neurons in first hidden layer
H <- 3 # number of neurons in second hidden layer
I <- 6 # number of inputs

random_weights <- new("Weights2", alpha = rnorm(1), alpha_1m = rnorm(M), alpha_2h = rnorm(H), 
                      w_h = rnorm(H), q_mh = matrix(nrow=M,ncol=H, data=rnorm(M*H)),
                      w_im = matrix(nrow=I,ncol=M, data=rnorm(I*M)))



