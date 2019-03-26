library(kernDeepStackNet)


### Name: randomFourierTrans
### Title: Random Fourier transformation
### Aliases: randomFourierTrans
### Keywords: models & regression

### ** Examples

# Generate data matrix
X <- data.frame(rnorm(100), rnorm(100), rnorm(100), rnorm(100), rnorm(100), 
factor(sample(c("a", "b", "c", "d", "e"), 100, replace=TRUE)))
X <- model.matrix(object=~., data=X) 
# Exclude intercept
X <- X[, -1]

# Apply a random Fourier transformation of lower dimension
rft <- randomFourierTrans(X=X, Dim=2, sigma=1, seedW=0)

# Transformed data
rft$Z

# Used weight matrix
rft$rW



