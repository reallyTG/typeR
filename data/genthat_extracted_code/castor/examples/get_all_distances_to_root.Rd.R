library(castor)


### Name: get_all_distances_to_root
### Title: Get distances of all tips and nodes to the root.
### Aliases: get_all_distances_to_root
### Keywords: phylogenetic distance

### ** Examples

# generate a random tree
Ntips = 1000
tree = generate_random_tree(list(birth_rate_intercept=1, 
                            	 death_rate_intercept=0.5),
                            max_tips=Ntips)$tree

# calculate distances to root
all_distances = get_all_distances_to_root(tree)

# extract distances of nodes to root
node_distances = all_distances[(Ntips+1):(Ntips+tree$Nnode)]

# plot histogram of distances (across all nodes)
hist(node_distances, xlab="distance to root", ylab="# nodes", prob=FALSE);



