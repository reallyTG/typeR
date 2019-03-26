library(dae)


### Name: fac.combine
### Title: Combines several factors into one
### Aliases: fac.combine
### Keywords: factor manip

### ** Examples

## set up two factors
A <- factor(rep(1:2, each=6))
B <- factor(rep(1:3, each=2, times=2))

## obtain six-level factor corresponding to the combinations of A and B
AB <- fac.combine(list(A,B))



