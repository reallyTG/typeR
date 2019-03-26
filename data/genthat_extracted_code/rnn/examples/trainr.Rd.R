library(rnn)


### Name: trainr
### Title: Recurrent Neural Network
### Aliases: trainr

### ** Examples

## Not run: 
##D # create training numbers
##D X1 = sample(0:127, 10000, replace=TRUE)
##D X2 = sample(0:127, 10000, replace=TRUE)
##D 
##D # create training response numbers
##D Y <- X1 + X2
##D 
##D # convert to binary
##D X1 <- int2bin(X1, length=8)
##D X2 <- int2bin(X2, length=8)
##D Y  <- int2bin(Y,  length=8)
##D 
##D # create 3d array: dim 1: samples; dim 2: time; dim 3: variables
##D X <- array( c(X1,X2), dim=c(dim(X1),2) )
##D 
##D # train the model
##D model <- trainr(Y=Y,
##D                 X=X,
##D                 learningrate   =  1,
##D                 hidden_dim     = 16  )
## End(Not run)
    



