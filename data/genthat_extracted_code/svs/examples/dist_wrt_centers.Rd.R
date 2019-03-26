library(svs)


### Name: dist_wrt_centers
### Title: Compute Distances with respect to Cluster Centers
### Aliases: dist_wrt_centers

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.SndT_Fra <- fast_sca(SndT_Fra)
kcl.SndT_Fra <- kmeans(sca.SndT_Fra$pos1, centers = 7)
dist_wrt_centers(sca.SndT_Fra$pos1, clusters = kcl.SndT_Fra, freq = freq_ca(SndT_Fra[, 1]))



