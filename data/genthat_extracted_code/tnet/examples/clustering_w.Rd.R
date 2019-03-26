library(tnet)


### Name: clustering_w
### Title: Generalised clusering coefficient
### Aliases: clustering_w

### ** Examples

## Generate a random graph
#density: 300/(100*99)=0.03030303; 
#this should be average from random samples
rg <- rg_w(nodes=100,arcs=300,weights=1:10)

## Run clustering function
clustering_w(rg)




