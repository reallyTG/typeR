library(limSolve)


### Name: ldp
### Title: Least Distance Programming
### Aliases: ldp
### Keywords: algebra array optimize

### ** Examples

# parsimonious (simplest) solution
G <- matrix(nrow = 2, ncol = 2, data = c(3, 2, 2, 4))
H <- c(3, 2)

ldp(G, H)



