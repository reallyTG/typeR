library(FarmTest)


### Name: print.farm.test
### Title: Summarize and print the results of the multiple testing
### Aliases: print.farm.test

### ** Examples

set.seed(100)
p = 50
n = 100
X = matrix(rnorm( p*n, 0,1), nrow = n)
output = farm.test(X)
output
names(output)



