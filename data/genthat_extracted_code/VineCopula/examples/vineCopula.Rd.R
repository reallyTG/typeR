library(VineCopula)


### Name: vineCopula
### Title: Constructor of the Class 'vineCopula'.
### Aliases: vineCopula
### Keywords: distribution mulitvariate

### ** Examples


# a C-vine of independent copulas
vine <- vineCopula(4L, "CVine")

library(copula)
library(lattice)

cloud(V1 ~ V2 + V3, as.data.frame(rCopula(500, vine)))




