library(ppsbm)


### Name: convertNodePair
### Title: Convert node pair (i,j)
### Aliases: convertNodePair

### ** Examples

# Convert the node pair (3,7) into an index, where the total number of nodes is 10,
# for directed and undirected graph

i <- 3
j <- 7
n <- 10

directedIndex <- convertNodePair(i,j,n,TRUE)
undirectedIndex <- convertNodePair(i,j,n,FALSE)




