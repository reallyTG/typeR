library(SOUP)


### Name: FWEminP
### Title: FWE Adjustment Using Permutation
### Aliases: FWEminP

### ** Examples

set.seed(123)
P <- matrix(runif(1010), nrow = 101, ncol = 10,
  dimnames = list(c("p-obs", paste("p-*", 1L:100)), LETTERS[1L:10]))
P[1L, 1L:4] <- 1/100
FWEminP(P)



