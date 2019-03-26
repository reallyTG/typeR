library(LICORS)


### Name: normalize
### Title: Normalize a matrix/vector to sum to one (probability simplex)
### Aliases: normalize
### Keywords: array manip

### ** Examples

print(normalize(c(1, 4, 2, 2, 10)))
print(normalize(c(-1, -2, -1)))
AA <- matrix(rnorm(12), ncol = 3)
print(normalize(AA, byrow = TRUE))
print(normalize(AA, byrow = FALSE))



