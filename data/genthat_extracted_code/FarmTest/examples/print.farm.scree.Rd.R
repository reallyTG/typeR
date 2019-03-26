library(FarmTest)


### Name: print.farm.scree
### Title: Summarize and print the results of the eignevalue ratio test
### Aliases: print.farm.scree

### ** Examples

set.seed(100)
p = 100
n = 20
epsilon = matrix(rnorm( p*n, 0,1), nrow = n)
B = matrix(rnorm(p*3,0,1), nrow=p)
fx = matrix(rnorm(3*n, 0,1), nrow = n)
X = fx%*%t(B)+ epsilon
output = farm.scree(X, cv = FALSE)
output



