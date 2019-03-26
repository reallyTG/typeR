library(FD)


### Name: functcomp
### Title: Functional Composition
### Aliases: functcomp
### Keywords: multivariate

### ** Examples

# for ordinal, nominal and binary variables
# returns only the most frequent class
ex1 <- functcomp(dummy$trait, dummy$abun)
ex1

# returns the frequencies of each class
ex2 <- functcomp(dummy$trait, dummy$abun, CWM.type = "all")
ex2

# example with real data from New Zealand short-tussock grasslands
ex3 <- functcomp(tussock$trait, tussock$abun)
ex3



