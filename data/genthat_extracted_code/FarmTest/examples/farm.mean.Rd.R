library(FarmTest)


### Name: farm.mean
### Title: Mean estimation with Huber's loss function
### Aliases: farm.mean

### ** Examples

set.seed(100)
p = 20
n = 10
X = matrix(rnorm( p*n, 0,1), nrow = n)
muhat = farm.mean(X)




