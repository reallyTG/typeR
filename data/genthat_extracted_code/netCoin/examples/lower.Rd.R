library(netCoin)


### Name: lower
### Title: Similarity/distance matrix display.
### Aliases: lower

### ** Examples

# From a random incidence matrix I(25X4)
I <- matrix(rbinom(100, 1, .5), nrow = 25, ncol = 4,
     dimnames = list(NULL, c("A", "B", "C", "D")))
lower(sim(I, "Jaccard"), 2)



