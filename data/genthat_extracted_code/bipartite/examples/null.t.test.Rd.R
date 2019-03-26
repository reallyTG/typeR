library(bipartite)


### Name: null.t.test
### Title: Compares observed pattern to random webs.
### Aliases: null.t.test
### Keywords: package

### ** Examples

data(mosquin1967)
null.t.test(mosquin1967, index=c("generality", "vulnerability",
    "cluster coefficient", "H2", "ISA", "SA"), nrep=2, N=10)



