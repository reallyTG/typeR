library(stream)


### Name: nclusters
### Title: nclusters
### Aliases: nclusters

### ** Examples

# setting up the objects
stream <- DSD_Gaussians(k=3)
dstream <- DSC_DStream(gridsize=0.1)
update(dstream, stream, 500)

# retrieving the results
get_centers(dstream)
nclusters(dstream)



