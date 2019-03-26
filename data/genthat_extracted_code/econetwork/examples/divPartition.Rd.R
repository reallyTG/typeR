library(econetwork)


### Name: divPartition
### Title: Partitionning network diversity in alpha, beta and gamma
###   diversity
### Aliases: divPartition

### ** Examples

# Generating a set of Erdos-Renyi graphs and give name to nodes
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

# Measure of link diversity
divPartition(gList, groups, framework='Chao', type = 'L') 



