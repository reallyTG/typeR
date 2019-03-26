library(hierarchicalSets)


### Name: create_hierarchy
### Title: Create and store hierarchcical sets
### Aliases: HierarchicalSet [.HierarchicalSet [[.HierarchicalSet
###   cluster_members.HierarchicalSet cluster_sizes.HierarchicalSet
###   clusters.HierarchicalSet create_hierarchy
###   element_names.HierarchicalSet length.HierarchicalSet
###   n_clusters.HierarchicalSet n_elements.HierarchicalSet
###   n_sets.HierarchicalSet print.HierarchicalSet
###   set_membership.HierarchicalSet set_names.HierarchicalSet
###   sets.HierarchicalSet

### ** Examples

data('twitter')

# Caclulate the clustering
twitSet <- create_hierarchy(twitter)

# Some statistics on the data
n_sets(twitSet)
n_elements(twitSet)
n_clusters(twitSet)

# Focus on the first two independent cluster
twitSet[1:2]

# Extract a dendrogram representation of the firrst cluster
twitSet[[1]]




