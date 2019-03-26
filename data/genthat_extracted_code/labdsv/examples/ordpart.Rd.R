library(labdsv)


### Name: ordpart
### Title: Ordination Partitioning
### Aliases: ordpart ordpart.pca ordpart.pco ordpart.nmds
### Keywords: hplot aplot iplot cluster

### ** Examples

data(bryceveg)
data(brycesite)
dis.bc <- dsvdis(bryceveg,'bray/curtis')
nmds.1 <- nmds(dis.bc,5)
plot(nmds.1)
## Not run: clustering <- ordpart(nmds.1)



