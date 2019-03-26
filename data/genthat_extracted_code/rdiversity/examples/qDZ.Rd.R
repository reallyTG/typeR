library(rdiversity)


### Name: qDZ
### Title: Similarity-sensitive diversity
### Aliases: qDZ

### ** Examples

pop <- sample(1:50, 5)

# Create similarity matrix
Z <- diag(1, length(pop))
Z[Z==0] <- 0.4

dat <- metacommunity(pop, Z)

# Calculate similarity-sensitive diversity of order 0 (species richness)
qDZ(dat, 0)




