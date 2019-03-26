library(kernDeepStackNet)


### Name: lossSharedCvKDSN
### Title: Kernel deep stacking network loss function based on
###   cross-validation and shared hyperparameters
### Aliases: lossSharedCvKDSN
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

# Draw random test sets
library(caret)
Indices <- createMultiFolds(y=y, k = 10, times = 5)

# Calculate loss function with parameters (D=10, sigma=1, lambda=0)
# in one level
calcLoss <- lossSharedCvKDSN(parOpt=c(1, 10, 1, 0), y=y, X=X, 
cvIndex=Indices, seedW=0)
c(calcLoss)



