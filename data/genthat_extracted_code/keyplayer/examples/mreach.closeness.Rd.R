library(keyplayer)


### Name: mreach.closeness
### Title: Compute the M-reach Closeness Centrality Score in a Netwrok
### Aliases: mreach.closeness

### ** Examples

# Create a 5x5 weighted and directed adjacency matrix, where edge values
# represent the strength of tie
W <- matrix(
  c(0,1,3,0,0,
    0,0,0,4,0,
    1,1,0,2,0,
    0,0,0,0,3,
    0,2,0,0,0),
    nrow=5, ncol=5, byrow = TRUE)

# Transform the edge value to distance interpretaion
A <- W
A[W!=0] <- 1/W[W!=0]

# List all types of 2-reach closeness scores for every node
mreach.closeness(A,M=2,cmode="all",large=FALSE)




