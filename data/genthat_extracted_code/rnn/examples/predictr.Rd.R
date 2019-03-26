library(rnn)


### Name: predictr
### Title: Recurrent Neural Network
### Aliases: predictr

### ** Examples

## Not run: 
##D  
##D # create training numbers
##D X1 = sample(0:127, 10000, replace=TRUE)
##D X2 = sample(0:127, 10000, replace=TRUE)
##D 
##D # create training response numbers
##D Y <- X1 + X2
##D 
##D # convert to binary
##D X1 <- int2bin(X1)
##D X2 <- int2bin(X2)
##D Y  <- int2bin(Y)
##D 
##D # Create 3d array: dim 1: samples; dim 2: time; dim 3: variables.
##D X <- array( c(X1,X2), dim=c(dim(X1),2) )
##D 
##D # train the model
##D model <- trainr(Y=Y[,dim(Y)[2]:1],
##D                 X=X[,dim(X)[2]:1,],
##D                 learningrate   =  1,
##D                 hidden_dim     = 16 )
##D              
##D # create test inputs
##D A1 = int2bin( sample(0:127, 7000, replace=TRUE) )
##D A2 = int2bin( sample(0:127, 7000, replace=TRUE) )
##D 
##D # create 3d array: dim 1: samples; dim 2: time; dim 3: variables
##D A <- array( c(A1,A2), dim=c(dim(A1),2) )
##D     
##D # predict
##D B  <- predictr(model,
##D                A[,dim(A)[2]:1,]     )
##D B = B[,dim(B)[2]:1]
##D # convert back to integers
##D A1 <- bin2int(A1)
##D A2 <- bin2int(A2)
##D B  <- bin2int(B)
##D  
##D # inspect the differences              
##D table( B-(A1+A2) )
##D 
##D # plot the difference
##D hist(  B-(A1+A2) )
## End(Not run)




