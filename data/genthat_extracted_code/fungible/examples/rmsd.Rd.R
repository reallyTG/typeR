library(fungible)


### Name: rmsd
### Title: Root Mean Squared Deviation of (A - B)
### Aliases: rmsd
### Keywords: stats

### ** Examples

A <- matrix(rnorm(9), nrow = 3)
B <- matrix(rnorm(9), nrow = 3)

( rmsd(A, B, Symmetric = FALSE, IncludeDiag = TRUE) )



