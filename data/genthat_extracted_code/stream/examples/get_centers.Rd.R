library(stream)


### Name: get_centers
### Title: Get Cluster Centers from a DSC
### Aliases: get_centers

### ** Examples

stream <- DSD_Gaussians(k=3, d=2)
dstream <- DSC_DStream(gridsize=.1)
update(dstream, stream, 500)
dstream
  
# getting the micro-cluster centers
get_centers(dstream)

# D-Stream also has macro-clusters
get_centers(dstream, type="macro")



