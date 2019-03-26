library(rdiversity)


### Name: qDZ_single
### Title: Similarity-sensitive diversity of a single population
### Aliases: qDZ_single

### ** Examples

pop <- sample(1:50, 5)

# Create similarity matrix
Z <- diag(1, length(pop))
Z[Z==0] <- 0.4

# Calculate similarity-sensitive diversity of order 0 (species richness)
qDZ_single(pop, 0, Z)




