library(kernDeepStackNet)


### Name: lossCvKDSN
### Title: Kernel deep stacking network loss function based on
###   cross-validation
### Aliases: lossCvKDSN
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
calcLoss <- lossCvKDSN(parOpt=c(10, 1, 0), y=y, X=X, 
cvIndex=Indices, seedW=0, levels=1)
c(calcLoss)

# Calculate loss function with parameters 
# (D=10, sigma=1, lambda=0.1, D=5, sigma=2, lambda=0.01) in two levels
calcLoss <- lossCvKDSN(parOpt=c(10, 1, 0.1, 5, 2, 0.01), 
y=y, X=X, cvIndex=Indices, seedW=1:2, levels=2)
c(calcLoss)



