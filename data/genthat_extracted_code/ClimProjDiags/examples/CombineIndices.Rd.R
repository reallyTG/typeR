library(ClimProjDiags)


### Name: CombineIndices
### Title: Combine weighted indices of n-dimensional arrays
### Aliases: CombineIndices

### ** Examples

a <- matrix(rnorm(6), 2, 3)
b <- matrix(rnorm(6), 2, 3)

comb_ind <- CombineIndices(indices = list(a, b), weights = c(2, 1), operation = "add")
print(comb_ind)

a <- rnorm(24)
dim(a) <- c(lon = 2, lat = 3, mod = 4)
b <- rnorm(24)
dim(b) <- c(lon = 2, lat = 3, mod = 4)
comb_ind <- CombineIndices(indices = list(a, b), weights = c(2, 1), operation = "add")
print(comb_ind)



