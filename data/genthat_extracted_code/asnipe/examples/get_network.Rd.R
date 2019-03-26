library(asnipe)


### Name: get_network
### Title: Calculating Weighted Network
### Aliases: get_network

### ** Examples

data("group_by_individual")
data("times")

# subset GBI (to reduce run time of the example)
gbi <- gbi[,1:80]

## define to 2 x N x N network to hold two association matrices
networks <- array(0, c(2, ncol(gbi), ncol(gbi)))

## calculate network for first half of the time
networks[1,,] <- get_network(gbi, data_format="GBI",
	association_index="SRI", times=times, start_time=0, 
	end_time=max(times)/2)
networks[2,,] <- get_network(gbi, data_format="GBI",
	association_index="SRI", times=times, 
	start_time=max(times)/2, end_time=max(times))

## test if one predicts the other via a mantel test (must be loaded externally)
library(ape)
mantel.test(networks[1,,],networks[2,,])

## convert to igraph network and calculate degree of the first network
## Not run: 
##D library(igraph)
##D net <- graph.adjacency(networks[1,,], mode="undirected", diag=FALSE, weighted=TRUE)
##D deg_weighted <- graph.strength(net)
##D detach(package:igraph)
##D 
##D 
##D ## alternatively package SNA can use matrix stacks directly
##D library(sna)
##D deg_weighted <- degree(networks,gmode="graph", g=c(1,2), ignore.eval=FALSE)
##D detach(package:sna)
## End(Not run)



