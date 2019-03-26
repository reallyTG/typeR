library(GreedySBTM)


### Name: GreedyMerge
### Title: GreedyMerge
### Aliases: GreedyMerge

### ** Examples

set.seed(12345)
data(reality_mining_84)
tframes <- dim(reality_mining_84)[3]
N <- dim(reality_mining_84)[1]

### Evaluate matrix containing the degrees of each node at each time
degrees <- apply(X = reality_mining_84, MARGIN = c(1,3), FUN = sum)

### create a binary matrix with ones corresponding to inactive nodes
inactive_nodes <- degrees == 0

### create an edgelist listing all of the ids (time, node_label) of inactive nodes 
n_inactive_nodes <- sum(inactive_nodes)
list_of_inactive_nodes <- matrix(NA,n_inactive_nodes,2)
index <- 1
for (t in 1:tframes) for (i in 1:N)  if (inactive_nodes[i,t])
{
  list_of_inactive_nodes[index,1] = t
  list_of_inactive_nodes[index,2] = i
  index = index + 1
}

### Find starting allocations using k-means
allocations_init <- GreedyInit(reality_mining_84, 20, list_of_inactive_nodes)

### Run the GreedyICL algorithm (this may take some time)
output_greedy <- GreedyICL(reality_mining_84, allocations_init, max_n_iter = 1)
### max_n_iter is set to 1 to speed up the demonstration: 
### please always use max_n_iter = 100 in applications

### Run the hierarchical clustering routine
output_merge <- GreedyMerge(adj_cube = reality_mining_84, allocations = output_greedy$allocations)
str(output_merge)




