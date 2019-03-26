library(kst)


### Name: as.famset
### Title: Convert a binary matrix to a family of sets
### Aliases: as.famset
### Keywords: math

### ** Examples

m <- matrix(c(1, 0, 0, 1, 1, 0), nrow = 2, ncol = 3)
m
as.famset(m)
as.famset(m, as.letters = FALSE)



