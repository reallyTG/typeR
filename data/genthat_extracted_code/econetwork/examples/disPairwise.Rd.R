library(econetwork)


### Name: disPairwise
### Title: Computation of the dissimilarity matrix (pairwise
###   beta-diversity) for a set of networks
### Aliases: disPairwise

### ** Examples

# Generating a set of Erdos-Renyi graphs and give name to nodes.
library(igraph)
nbGraph = 10
gList = c()
n = 57 # number of nodes of each graph
C = 0.1  # connectance of each graph
for(i in 1:nbGraph){
  graphLocal = erdos.renyi.game(n, type='gnp', p.or.m =C, directed=TRUE)
  V(graphLocal)$name = as.character(1:57)
  gList = c(gList,list(graphLocal))
}

groups = c(rep("a",23),rep("b",34)) # vector that gives the group of each node
names(groups) = as.character(1:57)

# Dissimilarity matrix based on links beta-diversity
disPairwise(gList, groups, type = 'L') 



