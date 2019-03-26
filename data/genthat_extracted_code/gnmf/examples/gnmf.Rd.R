library(gnmf)


### Name: gnmf
### Title: Generalized non-negative matrix factorization based on Renyi
###   Divergence
### Aliases: gnmf
### Keywords: Clustering Multivariate Techniques

### ** Examples

# Load sample data.
data(V)

# Compute NMF with 20 repeats.
result <- gnmf(V,scheme="KL")

# Extract H and W from the result.
# H and W are lists, each containing the result of 20 repeats.
H <- result$H
W <- result$W

# Get the H and W matrices of the first repeat.
H1 <- H[[1]]
W1 <- W[[1]]



