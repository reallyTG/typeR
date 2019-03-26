library(hierarchicalSets)


### Name: HierarchicalSet-getters
### Title: Getters for HierarchicalSet objects
### Aliases: HierarchicalSet-getters cluster_members cluster_sizes clusters
###   element_names n_clusters n_elements n_sets set_membership set_names
###   sets

### ** Examples

data('twitter')

twitSet <- create_hierarchy(twitter)

# Get the sets as a presence/absence matrix
head(sets(twitSet))

# Get the clustering of the HierarchicalSet object
clusters(twitSet)

# Get the set names
set_names(twitSet)

# Get the element names or NULL if they are unnamed
element_names(twitSet)

# Get the number of sets
n_sets(twitSet)

# Get the number of elements
n_elements(twitSet)

# Get the number of independent clusters
n_clusters(twitSet)

# Get the size of each independent clusters
cluster_sizes(twitSet)

# Get the members of each independent clusters
cluster_members(twitSet)

# Get the membership of each set
set_membership(twitSet)




