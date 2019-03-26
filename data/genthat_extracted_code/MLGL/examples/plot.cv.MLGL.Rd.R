library(MLGL)


### Name: plot.cv.MLGL
### Title: Plot the cross-validation obtained from 'cv.MLGL' function
### Aliases: plot.cv.MLGL

### ** Examples

set.seed(42)
# Simulate gaussian data with block-diagonal variance matrix containing 12 blocks of size 5
X <- simuBlockGaussian(50, 12, 5, 0.7)
# Generate a response variable
y <- drop(X[,c(2,7,12)]%*%c(2,2,-2)+rnorm(50,0,0.5))
# Apply cv.MLGL method
res <- cv.MLGL(X,y)
# Plot the cv error curve
plot(res) 





