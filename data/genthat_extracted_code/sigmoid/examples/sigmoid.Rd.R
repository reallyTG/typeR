library(sigmoid)


### Name: sigmoid
### Title: Sigmoid
### Aliases: sigmoid

### ** Examples

# create input vector
a <- seq(-10,10)

# use sigmoid with default standard logistic
( b <- sigmoid(a) )

# show shape
plot(b)

# inverse
hist( a - sigmoid(b, inverse=TRUE) )

# with SoftMax
( c <- sigmoid(a, SoftMax=TRUE) )

# show difference
hist(b-c)



