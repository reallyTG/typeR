library(keyplayer)


### Name: contract
### Title: Group the Chosen Players in a Network
### Aliases: contract

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

# If the strength is believed to be non-accumulative for a group of nodes,
# it is proper to use the "maximum" criterion to contract node 2 and 3
contract(W,c(2,3),"max")

# Transform the edge value to probability interpretaion
P <- W *0.2

# Contract node 2 and 3 using the "union" criterion as it is proper for
# probability matrix input
contract(P,c(2,3),"union")




