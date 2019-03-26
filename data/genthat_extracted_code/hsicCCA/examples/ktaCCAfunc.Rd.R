library(hsicCCA)


### Name: ktaCCAfunc
### Title: Canonical Correlation Analysis based on the centered kernel
###   target alignment.
### Aliases: ktaCCAfunc

### ** Examples

set.seed(10)
numData <- 100
numDim <- 2
x <- matrix(rnorm(numData*numDim),numData,numDim)
y <- matrix(rnorm(numData*numDim),numData,numDim)
z <- runif(numData,-pi,pi)
y[,1] <- cos(z)+rnorm(numData,sd=0.1); x[,1] <- sin(z)+rnorm(numData,sd=0.1)
x <- scale(x)
y <- scale(y)

fit <- ktaCCAfunc(x,y,sigmax=1,sigmay=1)
plot(x%*%fit$Wx,y%*%fit$Wy)



