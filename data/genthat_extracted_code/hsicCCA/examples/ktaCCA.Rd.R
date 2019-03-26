library(hsicCCA)


### Name: ktaCCA
### Title: Canonical Correlation Analysis based on the Centered Kernel
###   Target Alignment.
### Aliases: ktaCCA

### ** Examples

set.seed(1)
numData <- 100
numDim <- 3
x <- matrix(rnorm(numData*numDim),numData,numDim)
y <- matrix(rnorm(numData*numDim),numData,numDim)
z <- runif(numData,-pi,pi)
y[,1] <- cos(z)+rnorm(numData,sd=0.1); x[,1] <- sin(z)+rnorm(numData,sd=0.1)
y[,2] <- x[,2]+rnorm(numData,sd=0.5)
x <- scale(x)
y <- scale(y)

fit <- ktaCCA(x,y,2,numrepeat=2,numiter=10)
par(mfrow=c(1,2))
for (K in 1:2) plot(x%*%fit$Wx[,K],y%*%fit$Wy[,K])



