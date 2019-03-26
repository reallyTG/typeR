library(FD)


### Name: fdisp
### Title: Functional Dispersion
### Aliases: fdisp
### Keywords: multivariate

### ** Examples

# dummy dataset
dummy.dist <- gowdis(dummy$trait)
ex1 <- fdisp(dummy.dist, dummy$abun)
ex1

# example with real data from New Zealand short-tussock grasslands
ex2 <- fdisp(gowdis(tussock$trait), tussock$abun)
ex2



