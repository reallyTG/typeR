library(MultiLCIRT)


### Name: standard.matrix
### Title: Standardization of a matrix of support points on the basis of a
###   vector of probabilities
### Aliases: standard.matrix
### Keywords: multivariate statistics

### ** Examples

## Example of standardization of a randomly generated distribution
X = matrix(rnorm(100),20,5)
piv = runif(20); piv = piv/sum(piv)
out = standard.matrix(X,piv)



