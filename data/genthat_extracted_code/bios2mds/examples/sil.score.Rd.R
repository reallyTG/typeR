library(bios2mds)


### Name: sil.score
### Title: Silhouette score
### Aliases: sil.score
### Keywords: clustering

### ** Examples

# calculating silhouette scores for K-means clustering of human GPCRs:
data(gpcr)
active <- gpcr$dif$sapiens.sapiens
mds <- mmds(active)
sil.score1 <- sil.score(mds$coord, nb.clus = c(2:10),
 nb.run = 100, iter.max = 100)
barplot(sil.score1)



