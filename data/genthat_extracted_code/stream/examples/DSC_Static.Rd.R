library(stream)


### Name: DSC_Static
### Title: Create as Static Copy of a Clustering
### Aliases: DSC_Static

### ** Examples

stream <- DSD_Gaussians(k=3, noise=0.05)

dstream <- DSC_DStream(gridsize=0.05)
update(dstream, stream, 500)
dstream
plot(dstream, stream)
  
# create a static copy of the clustering
static <- DSC_Static(dstream)
static
plot(static, stream)
  
# copy only the 5 largest clusters
static2 <- DSC_Static(dstream, k_largest=5)
static2
plot(static2, stream)

# copy all clusters with a weight of at least .3
static3 <- DSC_Static(dstream, min_weight=.3)
static3
plot(static3, stream)



