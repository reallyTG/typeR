library(keyplayer)


### Name: mreach.degree
### Title: Compute the M-reach Degree Centrality Score in a Netwrok
### Aliases: mreach.degree

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


# List the 2-reach degree scores for every node where W is binarized
mreach.degree(W,M=2,cmode="all",large=FALSE)




