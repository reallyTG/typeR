library(FD)


### Name: gowdis
### Title: Gower Dissimilarity
### Aliases: gowdis
### Keywords: multivariate

### ** Examples

ex1 <- gowdis(dummy$trait)
ex1

# check attributes
attributes(ex1)

# to include weights
w <- c(4,3,5,1,2,8,3,6)
ex2 <- gowdis(dummy$trait, w)
ex2

# variable 7 as asymmetric binary
ex3 <- gowdis(dummy$trait, asym.bin = 7)
ex3

# example with trait data from New Zealand vascular plant species
ex4 <- gowdis(tussock$trait)



