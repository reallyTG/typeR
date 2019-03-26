library(bayesboot)


### Name: rudirichlet
### Title: Produce random draws from a uniform Dirichlet distribution
### Aliases: rudirichlet

### ** Examples

set.seed(123)
rudirichlet(2, 3)
# Should produce the following matrix:
#       [,1]   [,2]   [,3]
# [1,] 0.30681 0.2097 0.4834
# [2,] 0.07811 0.1390 0.7829

# The above could be seen as a sample of two Bayesian bootstrap weights for a
# dataset of size three.



