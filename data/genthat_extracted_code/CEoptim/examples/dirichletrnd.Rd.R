library(CEoptim)


### Name: dirichletrnd
### Title: Dirichlet generator
### Aliases: dirichletrnd

### ** Examples

## Generation from the Dirichlet distribution 
## with parameter a=(1,2,3,4,5)

set.seed(12345)
a <- 1:5
n <- 10

y <- dirichletrnd(a,n)
y



