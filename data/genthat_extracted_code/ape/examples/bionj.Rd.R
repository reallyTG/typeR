library(ape)


### Name: BIONJ
### Title: Tree Estimation Based on an Improved Version of the NJ Algorithm
### Aliases: bionj
### Keywords: models

### ** Examples

### From Saitou and Nei (1987, Table 1):
x <- c(7, 8, 11, 13, 16, 13, 17, 5, 8, 10, 13,
       10, 14, 5, 7, 10, 7, 11, 8, 11, 8, 12,
       5, 6, 10, 9, 13, 8)
M <- matrix(0, 8, 8)
M[lower.tri(M)] <- x
M <- t(M)
M[lower.tri(M)] <- x
dimnames(M) <- list(1:8, 1:8)
tr <- bionj(M)
plot(tr, "u")
### a less theoretical example
data(woodmouse)
trw <- bionj(dist.dna(woodmouse))
plot(trw)



