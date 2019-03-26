library(MLGL)


### Name: print.MLGL
### Title: Print Values Print a 'MLGL' object
### Aliases: print.MLGL

### ** Examples

set.seed(42)
# Simulate gaussian data with block-diagonal variance matrix containing 12 blocks of size 5
X <- simuBlockGaussian(50, 12, 5, 0.7)
# Generate a response variable
y <- drop(X[,c(2,7,12)]%*%c(2,2,-2)+rnorm(50,0,0.5))
# Apply MLGL method
res <- MLGL(X,y)
print(res)




