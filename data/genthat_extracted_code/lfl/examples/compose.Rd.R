library(lfl)


### Name: compose
### Title: Composition of Fuzzy Relations
### Aliases: compose
### Keywords: models robust multivariate

### ** Examples

    R <- matrix(c(0.1, 0.6, 1, 0, 0, 0,
                  0, 0.3, 0.7, 0.9, 1, 1,
                  0, 0, 0.6, 0.8, 1, 0,
                  0, 1, 0.5, 0, 0, 0,
                  0, 0, 1, 1, 0, 0), byrow=TRUE, nrow=5)

    S <- matrix(c(0.9, 1, 0.9, 1,
                  1, 1, 1, 1,
                  0.1, 0.2, 0, 0.2,
                  0, 0, 0, 0,
                  0.7, 0.6, 0.5, 0.4,
                  1, 0.9, 0.7, 0.6), byrow=TRUE, nrow=6)

    RS <- matrix(c(0.6, 0.6, 0.6, 0.6,
                   1, 0.9, 0.7, 0.6,
                   0.7, 0.6, 0.5, 0.4,
                   1, 1, 1, 1,
                   0.1, 0.2, 0, 0.2), byrow=TRUE, nrow=5)

    compose(R, S, alg='goedel', type='basic') # should equal to RS



