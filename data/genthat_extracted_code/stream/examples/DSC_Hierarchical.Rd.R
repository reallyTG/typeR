library(stream)


### Name: DSC_Hierarchical
### Title: Hierarchical Micro-Cluster Reclusterer
### Aliases: DSC_Hierarchical

### ** Examples

# Cassini dataset
stream <- DSD_mlbenchGenerator("cassini")

# Use hierarchical clustering to recluster micro-clusters
dbstream <- DSC_DBSTREAM(r=.05)
update(dbstream, stream, 500)

# reclustering using single-link and specifying k
hc <- DSC_Hierarchical(k=3, method="single")
recluster(hc, dbstream)
hc
plot(hc, stream, type="both")

# reclustering by specifying height
hc <- DSC_Hierarchical(h=.2, method="single")
recluster(hc, dbstream)
hc
plot(hc, stream, type="both")

# For comparison we use hierarchical clustering directly on the data 
# Note: hierarchical clustering is not a data stream clustering algorithm!
hc <- DSC_Hierarchical(k=3, method="single")
update(hc, stream, 500)
plot(hc, stream)



