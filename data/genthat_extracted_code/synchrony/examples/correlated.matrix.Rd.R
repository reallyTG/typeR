library(synchrony)


### Name: correlated.matrix
### Title: correlated.matrix
### Aliases: correlated.matrix

### ** Examples

mat=correlated.matrix(rho=0.85, sigma=30, mu=10, nspecies=10)
# Check sd of each column
apply(mat$community, 2, sd)
# Check mean of each column
apply(mat$community, 2, mean)
# Check correlation of matrix
community.sync(mat$community)



