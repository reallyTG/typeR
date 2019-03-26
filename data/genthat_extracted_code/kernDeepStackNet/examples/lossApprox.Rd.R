library(kernDeepStackNet)


### Name: lossApprox
### Title: Kernel deep stacking network loss function
### Aliases: lossApprox
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

# Calculate loss function with parameters (D=10, sigma=1, lambda=0)
# in one layer
calcLoss <- lossApprox (parOpt=c(10, 1, 0), y=y, X=X, 
levels=1, seedW=0)
str(calcLoss)

# Calculate loss function with parameters 
# (D=10, sigma=1, lambda=0.1, D=5, sigma=2, lambda=0.01) in two layers
calcLoss <- lossApprox (parOpt=c(10, 1, 0.1, 5, 2, 0.01), 
y=y, X=X, levels=1, seedW=0)
str(calcLoss)



