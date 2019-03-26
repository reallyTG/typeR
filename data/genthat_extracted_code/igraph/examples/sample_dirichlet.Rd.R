library(igraph)


### Name: sample_dirichlet
### Title: Sample from a Dirichlet distribution
### Aliases: sample_dirichlet

### ** Examples

lpvs.dir    <- sample_dirichlet(n=20, alpha=rep(1, 10))
RDP.graph.2 <- sample_dot_product(lpvs.dir)
colSums(lpvs.dir)



