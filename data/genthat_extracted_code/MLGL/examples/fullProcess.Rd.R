library(MLGL)


### Name: fullProcess
### Title: Full process of MLGL
### Aliases: fullProcess fullProcess.formula

### ** Examples

# least square loss
set.seed(42)
X <- simuBlockGaussian(50, 12, 5, 0.7)
y <- drop(X[,c(2,7,12)] %*% c(2,2,-2) + rnorm(50, 0, 0.5))
res <- fullProcess(X, y)





