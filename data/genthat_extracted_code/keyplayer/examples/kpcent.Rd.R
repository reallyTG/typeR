library(keyplayer)


### Name: kpcent
### Title: Compute Group Centraltiy in a Network
### Aliases: kpcent

### ** Examples

# Create a 5x5 weighted and directed adjacency matrix,
# where edge values represent the strength of tie
W <- matrix(
  c(0,1,3,0,0,
    0,0,0,4,0,
    1,1,0,2,0,
    0,0,0,0,3,
    0,2,0,0,0),
    nrow=5, ncol=5, byrow = TRUE)

# List the degree centrality for group of node 2 and 3
kpcent(W,c(2,3),type="degree")

# Transform the edge value to distance interpretaion
# Compute the fragmentation centrality for node 2
A <- W
A[W!=0] <- 1/W[W!=0]
kpcent(A,2,type="fragment")

# Replicate the group-level degree centrality (normalized) when the weights
# are given by the inverse distances and report the outgoing score only
kpcent(A,c(2,3),type="mreach.closeness",binary=TRUE,M=1,cmode="outdegree")

# Transform the edge value to probability interpretation
# Compute the diffusion centrality with number of iteration 20
P <- 0.1*W
kpcent(P,c(2,3),type="diffusion",T=20)




