library(FD)


### Name: FD-package
### Title: Measuring Functional Diversity from Multiple Traits, and Other
###   Tools for Functional Ecology
### Aliases: FD-package FD
### Keywords: package

### ** Examples

# examples with a dummy dataset

ex1 <- gowdis(dummy$trait)
ex1

ex2 <- functcomp(dummy$trait, dummy$abun)
ex2

ex3 <- dbFD(dummy$trait, dummy$abun)
ex3

# examples with real data from New Zealand short-tussock grasslands
# these examples may take a few seconds to a few minutes each to run

ex4 <- gowdis(tussock$trait)

ex5 <- functcomp(tussock$trait, tussock$abun)

# 'lingoes' correction used because 'sqrt' does not work in that case
ex6 <- dbFD(tussock$trait, tussock$abun, corr = "lingoes")

## Not run: 
##D # ward clustering to compute FGR, cailliez correction
##D ex7 <- dbFD(tussock$trait, tussock$abun, corr = "cailliez",
##D calc.FGR = TRUE, clust.type = "ward")
##D # choose 'g' for number of groups
##D # 6 groups seems to make good ecological sense
##D ex7
##D 
##D # however, calinksi criterion in 'kmeans' suggests
##D # that 6 groups may not be optimal
##D ex8 <- dbFD(tussock$trait, tussock$abun, corr = "cailliez",
##D calc.FGR = TRUE, clust.type = "kmeans", km.sup.gr = 10)
## End(Not run)



