library(MLGL)


### Name: print.fullProcess
### Title: Print Values Print a 'fullProcess' object
### Aliases: print.fullProcess

### ** Examples

set.seed(42)
# Simulate gaussian data with block-diagonal variance matrix containing 12 blocks of size 5
X <- simuBlockGaussian(50, 12, 5, 0.7)
# Generate a response variable
y <- drop(X[,c(2,7,12)]%*%c(2,2,-2)+rnorm(50,0,0.5))
# Apply MLGL method
res <- fullProcess(X, y)
print(res)




