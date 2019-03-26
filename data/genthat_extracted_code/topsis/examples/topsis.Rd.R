library(topsis)


### Name: topsis
### Title: TOPSIS method for multiple-criteria decision making (MCDM)
### Aliases: topsis
### Keywords: topsis

### ** Examples

d <- matrix(rpois(12, 5), nrow = 4)
w <- c(1, 1, 2)
i <- c("+", "-", "+")
topsis(d, w, i)



