library(MLGL)


### Name: plot.stability.MLGL
### Title: Plot the stability path obtained from 'stability.MLGL' function
### Aliases: plot.stability.MLGL

### ** Examples

## No test: 
set.seed(42)
# Simulate gaussian data with block-diagonal variance matrix containing 12 blocks of size 5
X <- simuBlockGaussian(50, 12, 5, 0.7)
# Generate a response variable
y <- drop(X[,c(2,7,12)]%*%c(2,2,-2)+rnorm(50,0,0.5))
# Apply stability.MLGL method
res <- stability.MLGL(X,y)
selected <- plot(res)
print(selected)
## End(No test)




