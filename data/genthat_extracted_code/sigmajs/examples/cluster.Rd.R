library(sigmajs)


### Name: sg_cluster
### Title: Cluster
### Aliases: sg_cluster sg_get_cluster

### ** Examples

nodes <- sg_make_nodes() 
edges <- sg_make_edges(nodes, 15)

sigmajs() %>% 
  sg_nodes(nodes, id, size) %>% 
  sg_edges(edges, id, source, target) %>% 
  sg_layout() %>% 
  sg_cluster() 
  
clustered <- sg_get_cluster(nodes, edges)




