library(igraph)


### Name: dim_select
### Title: Dimensionality selection for singular values using profile
###   likelihood.
### Aliases: dim_select
### Keywords: graphs

### ** Examples


# Generate the two groups of singular values with 
# Gaussian mixture of two components that have different means
sing.vals  <- c( rnorm (10, mean=1, sd=1), rnorm(10, mean=3, sd=1) )
dim.chosen <- dim_select(sing.vals)
dim.chosen

# Sample random vectors with multivariate normal distribution
# and normalize to unit length
lpvs <- matrix(rnorm(200), 10, 20)
lpvs <- apply(lpvs, 2, function(x) { (abs(x) / sqrt(sum(x^2))) })
RDP.graph  <- sample_dot_product(lpvs)
dim_select( embed_adjacency_matrix(RDP.graph, 10)$D )

# Sample random vectors with the Dirichlet distribution
lpvs.dir    <- sample_dirichlet(n=20, rep(1, 10))
RDP.graph.2 <- sample_dot_product(lpvs.dir)
dim_select( embed_adjacency_matrix(RDP.graph.2, 10)$D )

# Sample random vectors from hypersphere with radius 1.
lpvs.sph    <- sample_sphere_surface(dim=10, n=20, radius=1)
RDP.graph.3 <- sample_dot_product(lpvs.sph)
dim_select( embed_adjacency_matrix(RDP.graph.3, 10)$D )




