library(kernDeepStackNet)


### Name: lossSharedTestKDSN
### Title: Kernel deep stacking network loss function with test set and
###   shared hyperparameters
### Aliases: lossSharedTestKDSN
### Keywords: models & regression

### ** Examples

####################################
# Example with simple binary outcome

# Generate covariate matrix
sampleSize <- 100
X <- matrix(0, nrow=100, ncol=10)
for(j in 1:10) {
  set.seed (j)
  X [, j] <- rnorm(sampleSize)
}

# Generate response of binary problem with sum(X) > 0 -> 1 and 0 elsewhere
# with Gaussian noise
set.seed(-1)
error <- rnorm (100)
y <- ifelse((rowSums(X) + error) > 0, 1, 0)

# Draw a subset as test data
library(caret)
Indices <- createDataPartition(y=y, times = 1, p=0.8) [[1]]

# Calculate loss function with parameters (D=10, sigma=1, lambda=0)
# in one level
calcLoss <- lossSharedTestKDSN(parOpt=c(1, 10, 1, 0), y=y, X=X, 
yTest=y[-Indices], Xtest=X[-Indices, , drop=FALSE], seedW=0)
c(calcLoss)



