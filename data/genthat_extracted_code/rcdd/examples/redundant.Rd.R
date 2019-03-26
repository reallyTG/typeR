library(rcdd)


### Name: redundant
### Title: Eliminate redundant rows of H-representation and
###   V-representation
### Aliases: redundant
### Keywords: misc

### ** Examples

hrep <- rbind(c(0, 0,  1,  1,  0),
              c(0, 0, -1,  0,  0),
              c(0, 0,  0, -1,  0),
              c(0, 0,  0,  0, -1),
              c(0, 0, -1, -1, -1))

redundant(d2q(hrep), representation = "H")

foo <- c(1, 0, -1)
hrep <- cbind(0, 1, rep(foo, each = 9), rep(foo, each = 3), foo)
print(hrep)
redundant(d2q(hrep), representation = "V")



