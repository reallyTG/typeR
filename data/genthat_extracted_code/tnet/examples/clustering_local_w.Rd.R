library(tnet)


### Name: clustering_local_w
### Title: Barrat et al. (2004) generalised local clusering coefficient
### Aliases: clustering_local_w

### ** Examples

## Generate a random graph
#density: 300/(100*99)=0.03030303; 
#this should be average from random samples
rg <- rg_w(nodes=100,arcs=300,weights=1:10,directed=FALSE)

## Run clustering function
clustering_local_w(rg)




