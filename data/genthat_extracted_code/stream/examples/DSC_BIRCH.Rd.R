library(stream)


### Name: DSC_BIRCH
### Title: Balanced Iterative Reducing Clustering using Hierarchies
### Aliases: DSC_BIRCH BIRCH birch

### ** Examples

stream <- DSD_Gaussians(k = 3, d = 2)

BIRCH <- DSC_BIRCH(treshold = .1, branching = 8, maxLeaf = 20)
update(BIRCH, stream, n = 500)

plot(BIRCH,stream)




