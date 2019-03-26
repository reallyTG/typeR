library(castor)


### Name: get_all_node_depths
### Title: Get the phylogenetic depth of each node in a tree.
### Aliases: get_all_node_depths
### Keywords: phylogenetic distance

### ** Examples

# generate a random tree
Ntips = 1000
tree = generate_random_tree(list(birth_rate_intercept=1, 
                            	 death_rate_intercept=0.5),
                            max_tips=Ntips)$tree

# calculate node phylogenetic depths
node_depths = get_all_node_depths(tree)

# plot histogram of node depths
hist(node_depths, xlab="phylogenetic depth", ylab="# nodes", prob=FALSE);



