library(RLT)


### Name: print.RLT
### Title: Print a RLT object
### Aliases: print.RLT

### ** Examples

x = matrix(rnorm(100), ncol = 10)
y = rowMeans(x)
fit = RLT(x, y, ntrees = 5)
fit



