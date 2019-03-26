library(netCoin)


### Name: distant
### Title: Distance matrix.
### Aliases: distant

### ** Examples

# From a random incidence matrix I(25X4)
I <- matrix(rbinom(100, 1, .5), nrow = 25, ncol = 4,
     dimnames = list(NULL, c("A", "B", "C", "D")))
J <- sim(I, "Jaccard")
distant(J, t = TRUE)
#Same results
sim(I, "Jaccard", distance = TRUE)



