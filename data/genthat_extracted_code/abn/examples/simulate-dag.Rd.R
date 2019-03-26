library(abn)


### Name: simulateDag
### Title: Simulate DAGs
### Aliases: simulateDag
### Keywords: simulated structure, DAG

### ** Examples

##example using Ozon entries:

dist <- list(Ozone="gaussian",
Solar.R="gaussian",
Wind="gaussian",
Temp="gaussian",
Month="gaussian",
Day="gaussian")
simulateDag(node.name = names(dist),data.dists = dist,nn = 0.8)



