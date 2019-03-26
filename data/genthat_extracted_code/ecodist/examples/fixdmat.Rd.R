library(ecodist)


### Name: fixdmat
### Title: Distance matrix conversion
### Aliases: fixdmat
### Keywords: manip multivariate

### ** Examples

x.vec <- seq_len(6)
x.vec

# Make an R-style column order symmetric matrix
full(x.vec)

# Extract the lower triangle from a symmetric matrix
# in column order
lower(full(x.vec))

# Convert to or from a row order symmetric matrix
fixdmat(x.vec)
lower(fixdmat(x.vec))

fixdmat(c(1, 2, 4, 3, 5, 6))



