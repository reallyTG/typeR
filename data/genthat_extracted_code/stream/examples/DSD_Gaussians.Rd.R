library(stream)


### Name: DSD_Gaussians
### Title: Mixture of Gaussians Data Stream Generator
### Aliases: DSD_Gaussians

### ** Examples

# create data stream with three clusters in 3-dimensional data space
stream1 <- DSD_Gaussians(k=3, d=3)

plot(stream1)


# create data stream with specified clusterpositions, 
# 20% noise in a given bounding box and
# with different densities (1 to 9 between the two clusters) 
stream2 <- DSD_Gaussians(k=2, d=2, 
    mu=rbind(c(-.5,-.5), c(.5,.5)), 
    noise=0.2, noise_range=rbind(c(-1,1),c(-1,1)),
    p=c(.1,.9))
plot(stream2)



