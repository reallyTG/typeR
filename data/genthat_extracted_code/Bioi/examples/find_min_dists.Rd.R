library(Bioi)


### Name: find_min_dists
### Title: For all points in matrix 1, return the distance to and index of
###   the nearest point in matrix 2.
### Aliases: find_min_dists

### ** Examples

# Generate random data.
set.seed(10)

mOne <- as.matrix(data.frame(
x = rnorm(10),
y = rbinom(10, 100, 0.5),
z = runif(10)
))

mTwo <- as.matrix(data.frame(
x = rnorm(20),
y = rbinom(20, 100, 0.5),
z = runif(20)
))

# Find the minimum distance between each point in mOne and the points in
# mTwo.
find_min_dists(mOne, mTwo)




