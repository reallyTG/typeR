library(adespatial)


### Name: Cperiodogram
### Title: Contingency periodogram
### Aliases: Cperiodogram

### ** Examples

# Data from the numerical example of Subsection 12.4.2 of Legendre and Legendre (2012).
test.vec <- c(1,1,2,3,3,2,1,2,3,2,1,1,2,3,3,1)
# Periodogram with tests using the chi-square distribution
res <- Cperiodogram(test.vec)
# Periodogram with permutation tests
res <- Cperiodogram(test.vec, nperm=2000, graph=FALSE)




