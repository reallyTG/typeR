library(igraph)


### Name: scg_semi_proj
### Title: Semi-Projectors
### Aliases: scg_semi_proj scgSemiProjectors

### ** Examples


library(Matrix)
# compute the semi-projectors and projector for the partition
# provided by a community detection method
g <- sample_pa(20, m = 1.5, directed = FALSE)
eb <- cluster_edge_betweenness(g)
memb <- membership(eb)
lr <- scg_semi_proj(memb)
#In the symmetric case L = R
tcrossprod(lr$R)  # same as lr$R %*% t(lr$R)
P <- crossprod(lr$R)  # same as t(lr$R) %*% lr$R
#P is an orthogonal projector
isSymmetric(P)
sum( (P %*% P-P)^2 )

## use L and R to coarse-grain the graph Laplacian
lr <- scg_semi_proj(memb, mtype="laplacian")
L <- laplacian_matrix(g)
Lt <- lr$L %*% L %*% t(lr$R)
## or better lr$L %*% tcrossprod(L,lr$R)
rowSums(Lt)




