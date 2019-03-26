library(iTOP)


### Name: process.custom.config.matrix
### Title: Process a custom configuration matrix.
### Aliases: process.custom.config.matrix

### ** Examples

set.seed(2)
n = 100
p = 100
x = matrix(rnorm(n*p)+10, n, p)
S = x%*%t(x)
S_dash = process.custom.config.matrix(S, center=TRUE, mod.rv=TRUE)



