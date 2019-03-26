library(corehunter)


### Name: distances
### Title: Create Core Hunter distance data from matrix or file.
### Aliases: distances

### ** Examples

# create from distance matrix
m <- matrix(runif(100), nrow = 10, ncol = 10)
diag(m) <- 0
# make symmetric
m[lower.tri(m)] <- t(m)[lower.tri(m)]
# set headers
rownames(m) <- colnames(m) <- paste("i", 1:10, sep = "-")

dist <- distances(m)

# read from file
dist.file <- system.file("extdata", "distances.csv", package = "corehunter")
dist <- distances(file = dist.file)




