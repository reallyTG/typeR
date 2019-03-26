library(MLGL)


### Name: hierarchicalFDR
### Title: Hierachical testing with FDR control
### Aliases: hierarchicalFDR

### ** Examples

set.seed(42)
X = simuBlockGaussian(50,12,5,0.7)
y = drop(X[,c(2,7,12)]%*%c(2,2,-2)+rnorm(50,0,0.5))
res = MLGL(X,y)
test = hierarchicalFDR(X, y, res$group[[20]], res$var[[20]])





