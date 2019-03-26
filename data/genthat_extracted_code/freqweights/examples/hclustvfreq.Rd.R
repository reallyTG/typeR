library(freqweights)


### Name: hclustvfreq
### Title: Fast hierarchical, agglomerative clustering of frequency data
### Aliases: hclustvfreq .hclustvfreq

### ** Examples

library(dplyr)
library(fastcluster)

data <- iris[,1:3,drop=FALSE]
hc <- hclustvfreq(data, method="centroid",metric="euclidean")
cutree(hc,3) ## Different length than data

tfq <- tablefreq(iris[,1:3])
hc <- .hclustvfreq(tfq, method="centroid",metric="euclidean")
tfq$group <- cutree(hc,3)



