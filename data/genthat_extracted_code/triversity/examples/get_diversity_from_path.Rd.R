library(triversity)


### Name: get_diversity_from_path
### Title: Compute the diversity associated to a random walk following a
###   path between the levels of a tripartite graph.
### Aliases: get_diversity_from_path

### ** Examples

data (tripartite_example)
tripartite <- get_tripartite (data=tripartite_example)


# COMPUTING DIFFERENT DIVERSITY VALUES FOR A GIVEN PATH

# Herfindahl-Hirschman index of nodes in level 3 wrt nodes in level 1
get_diversity_from_path (tripartite, path=c(1,2,3), measure='herfindahl')
1 / get_diversity_from_path (tripartite, path=c(1,2,3), order=2)

# Shannon entropy of nodes in level 3 wrt nodes in level 1
get_diversity_from_path (tripartite, path=c(1,2,3), measure='entropy')
log2 (get_diversity_from_path (tripartite, path=c(1,2,3), order=1))

# Some other diversity values of nodes in level 3 wrt nodes in level 1
get_diversity_from_path (tripartite, path=c(1,2,3), order=c(1,2,Inf),
                         measure=c('richness','bergerparker'))

# Eight of the main diversity values of nodes in level 3 wrt nodes in level 1
get_diversity_from_path (tripartite, path=c(1,2,3))


# SPECIFYING THE INITIAL DISTRIBUTION

# Diversity of nodes in level 3 wrt nodes in level 1 (with non-uniform weights)
get_diversity_from_path (tripartite, path=c(1,2,3), initial_distribution=c(0.75,0.25))

# Individual diversity of nodes in level 3 wrt node 'u1' in level 1
get_diversity_from_path (tripartite, path=c(1,2,3), initial_node='u1')
get_diversity_from_path (tripartite, path=c(1,2,3), initial_distribution=c(1,0))


# COMPUTING THE MEAN OF INDIVIDUAL DIVERSITES

# Mean of individual diversities of nodes in level 3 wrt nodes in level 2 (with
# uniform weights)
get_diversity_from_path (tripartite, path=c(2,3), conditional_path=c(2))

# Mean of individual diversities of nodes in level 3 wrt nodes in level 2 (weighted
# according to the path from level 1 to level 2, with a uniform distribution in level 1)
get_diversity_from_path (tripartite, path=c(2,3), conditional_path=c(1,2))

# Mean of individual diversities of nodes in level 3 wrt nodes in level 2 (weighted
# according to the path from level 1 to level 2, with only node 'u1' in level 1)
get_diversity_from_path (tripartite, path=c(2,3), conditional_path=c(1,2),
                         initial_node='u1')




