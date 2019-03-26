library(huge)


### Name: huge.npn
### Title: Nonparanormal(npn) transformation
### Aliases: huge.npn

### ** Examples

# generate nonparanormal data
L = huge.generator(graph = "cluster", g = 5)
L$data = L$data^5

# transform the data using the shrunken ECDF
Q = huge.npn(L$data)

# transform the non-Gaussian data using the truncated ECDF
Q = huge.npn(L$data, npn.func = "truncation")

# transform the non-Gaussian data using the truncated ECDF
Q = huge.npn(L$data, npn.func = "skeptic")




