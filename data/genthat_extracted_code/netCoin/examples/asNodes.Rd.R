library(netCoin)


### Name: asNodes
### Title: Nodes data frame.
### Aliases: asNodes

### ** Examples

# From a random incidence matrix I(25X4)
I <- matrix(rbinom(100, 1, .5), nrow = 25, ncol = 4,
     dimnames = list(NULL, c("A", "B", "C", "D")))
C <- coin(I)
asNodes(C)



