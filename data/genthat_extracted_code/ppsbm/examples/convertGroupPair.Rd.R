library(ppsbm)


### Name: convertGroupPair
### Title: Convert group pair (q,l)
### Aliases: convertGroupPair

### ** Examples

# Convert the group pair (3,2) into an index, where the total number of group is 3,
# for directed and undirected graph

q <- 3
l <- 2
Q <- 3

directedIndex <- convertGroupPair(q,l,Q)
undirectedIndex <- convertGroupPair(q,l,Q, FALSE)




