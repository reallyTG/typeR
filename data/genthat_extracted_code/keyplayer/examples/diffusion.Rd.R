library(keyplayer)


### Name: diffusion
### Title: Compute the Diffusion Centrality Score in a Network
### Aliases: diffusion

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

# Transform the edge value to probability interpretaion
P <- W *0.2

# List the diffusion centrality score for every node
diffusion(P, T = 2)




