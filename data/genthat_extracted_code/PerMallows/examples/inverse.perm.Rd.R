library(PerMallows)


### Name: inverse.perm
### Title: Generate inverse permutation
### Aliases: inverse.perm

### ** Examples

inverse.perm(c(1,2,3,4))
inverse.perm(c(2,3,4,1))
data <- matrix(c(1,2,3, 4,1,4,3,2,1,2,4,3), nrow = 3, ncol = 4, byrow = TRUE)
inverse.perm(data)



