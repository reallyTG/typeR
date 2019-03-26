library(stream)


### Name: get_weights
### Title: Get Cluster Weights
### Aliases: get_weights

### ** Examples

stream <- DSD_Gaussians(k=3, d=2)
dstream <- DSC_DStream(gridsize=.1)
update(dstream, stream, 500)
dstream
  
# getting the micro-cluster weights
get_weights(dstream)

# D-Stream also has macro-clusters
get_weights(dstream, type="macro")



