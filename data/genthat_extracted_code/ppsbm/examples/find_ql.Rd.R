library(ppsbm)


### Name: find_ql
### Title: Convert index into group pair
### Aliases: find_ql

### ** Examples

# Convert the index 5 into a group pair for undirected graph
# and the index 8 into a group pair for directed graph
# where the total number of group is 3

ind_ql_dir <- 8
ind_ql_undir <- 5

Q <- 3

directedIndex <- find_ql(ind_ql_dir,Q)
undirectedIndex <- find_ql(ind_ql_undir,Q, FALSE)




