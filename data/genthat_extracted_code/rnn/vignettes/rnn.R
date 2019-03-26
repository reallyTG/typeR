## ----package-------------------------------------------------------------
library(rnn)

## ----code-rnn, eval=FALSE------------------------------------------------
#  trainr

## ----sigmoid-------------------------------------------------------------
(a <- sigmoid::logistic(3))

## ----sigmoid-code--------------------------------------------------------
sigmoid::logistic

## ----sigmoid-der---------------------------------------------------------
sigmoid::sigmoid_output_to_derivative(a) # a was created above using sigmoid()

## ----sigmoid-der-code----------------------------------------------------
sigmoid::sigmoid_output_to_derivative

## ----seed----------------------------------------------------------------
set.seed(1)

## ----help, eval=FALSE----------------------------------------------------
#  help('trainr')

## ----int2bin-------------------------------------------------------------
# basic conversion
i2b <- function(integer, length=8)
  as.numeric(intToBits(integer))[1:length]

# apply to entire vectors
int2bin <- function(integer, length=8)
  t(sapply(integer, i2b, length=length))

## ----data----------------------------------------------------------------
# create sample inputs
X1 = sample(0:127, 5000, replace=TRUE)
X2 = sample(0:127, 5000, replace=TRUE)

# create sample output
Y <- X1 + X2

# convert to binary
X1 <- int2bin(X1)
X2 <- int2bin(X2)
Y  <- int2bin(Y)

# Create 3d array: dim 1: samples; dim 2: time; dim 3: variables.
X <- array( c(X1,X2), dim=c(dim(X1),2) )
Y <- array( Y, dim=c(dim(Y),1) ) 

## ----example-------------------------------------------------------------
# train the model
model <- trainr(Y=Y[,dim(Y)[2]:1,,drop=F], # we inverse the time dimension
                X=X[,dim(X)[2]:1,,drop=F], # we inverse the time dimension
                learningrate   =  0.1,
                hidden_dim     = 10,
                batch_size = 100,
                numepochs = 10)

## ----error---------------------------------------------------------------
plot(colMeans(model$error),type='l',
     xlab='epoch',
     ylab='errors'                  )

## ----test-data-----------------------------------------------------------
# create test inputs
A1 = int2bin( sample(0:127, 7000, replace=TRUE) )
A2 = int2bin( sample(0:127, 7000, replace=TRUE) )

# create 3d array: dim 1: samples; dim 2: time; dim 3: variables
A <- array( c(A1,A2), dim=c(dim(A1),2) )

## ----predictr------------------------------------------------------------
# predict
B  <- predictr(model,
               A[,dim(A)[2]:1,,drop=F]
               )
B = B[,dim(B)[2]:1]

## ----bin2int-------------------------------------------------------------
b2i <- function(binary)
  packBits(as.raw(c(binary, rep(0, 32-length(binary) ))), 'integer')

bin2int <- function(binary){
  binary <- round(binary)
  length <- dim(binary)[2]    # determine length of binary representation
  apply(binary, 1, b2i)     } # apply to full matrix

## ----test----------------------------------------------------------------
# convert back to integers
A1 <- bin2int(A1)
A2 <- bin2int(A2)
B  <- bin2int(B)

# plot the difference
hist( B-(A1+A2) )

