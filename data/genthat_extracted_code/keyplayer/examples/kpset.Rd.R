library(keyplayer)


### Name: kpset
### Title: Selecting the Most Central Group of Players in a Network
### Aliases: kpset

### ** Examples

# Create a 5x5 weighted and directed adjacency matrix
W <- matrix(
  c(0,1,3,0,0,
    0,0,0,4,0,
    1,1,0,2,0,
    0,0,0,0,3,
    0,2,0,0,0),
    nrow=5, ncol=5, byrow = TRUE)

# Find the most central player set sized 2 in terms of the degree centrality
kpset(W,size=2,type="degree")

# Find two most central players in terms of indegree
# via parallel computation using 5 cpu cores
kpset(W,size=2,type="degree", cmode="indegree", parallel = TRUE, cluster = 2)




