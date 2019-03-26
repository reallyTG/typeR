library(partitionComparison)


### Name: computePairCoefficients
### Title: Compute the four coefficients N_{11}, N_{10}, N_{01}, N_{00}
### Aliases: computePairCoefficients

### ** Examples

pc <- computePairCoefficients(new("Partition", c(0, 0, 0, 1, 1)), 
                              new("Partition", c(0, 0, 1, 1, 1)))
isTRUE(all.equal(N11(pc), 2))
isTRUE(all.equal(N10(pc), 2))
isTRUE(all.equal(N01(pc), 2))
isTRUE(all.equal(N00(pc), 4))




