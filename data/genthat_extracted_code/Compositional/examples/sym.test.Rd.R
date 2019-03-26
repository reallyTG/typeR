library(Compositional)


### Name: Log-likelihood ratio test for a symmetric Dirichlet distribution
### Title: Log-likelihood ratio test for a symmetric Dirichlet distribution
### Aliases: sym.test
### Keywords: symmetric Dirichlet distribution Log-likelihood ratio test

### ** Examples

x <- rdiri( 100, c(5, 7, 1, 3, 10, 2, 4) )
sym.test(x)
x <- rdiri( 100, c(5, 5, 5, 5, 5) )
sym.test(x)



