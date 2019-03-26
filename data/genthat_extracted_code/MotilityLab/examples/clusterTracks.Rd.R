library(MotilityLab)


### Name: clusterTracks
### Title: Cluster Tracks
### Aliases: clusterTracks

### ** Examples

## Cluster tracks according to the mean of their Hust exponents along X and Y

cells <- c(TCells,Neutrophils)
real.celltype <- rep(c("T","N"),c(length(TCells),length(Neutrophils)))
## Prefix each track ID with its cell class to evaluate the clustering visually
names(cells) <- paste0(real.celltype,seq_along(cells))
clust <- clusterTracks( cells, hurstExponent )
plot( clust )
## How many cells are "correctly" clustered?
sum( real.celltype == c("T","N")[cutree(clust,2)] )




