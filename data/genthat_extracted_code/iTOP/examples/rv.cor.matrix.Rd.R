library(iTOP)


### Name: rv.cor.matrix
### Title: A correlation matrix of RV coefficients
### Aliases: rv.cor.matrix

### ** Examples

set.seed(2)
n = 100
p = 100
x1 = matrix(rnorm(n*p), n, p)
x2 = x1 + matrix(rnorm(n*p), n, p)
x3 = x2 + matrix(rnorm(n*p), n, p)
data = list(x1=x1, x2=x2, x3=x3)
config_matrices = compute.config.matrices(data)
cors = rv.cor.matrix(config_matrices)



