library(MLGL)


### Name: selFWER
### Title: Selection from hierarchical testing with FWER control
### Aliases: selFWER

### ** Examples

set.seed(42)
X = simuBlockGaussian(50,12,5,0.7)
y = drop(X[,c(2,7,12)]%*%c(2,2,-2)+rnorm(50,0,0.5))
res = MLGL(X,y)
test = hierarchicalFWER(X, y, res$group[[20]], res$var[[20]])
sel = selFWER (test, alpha = 0.05)





