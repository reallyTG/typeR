library(nor1mix)


### Name: clus2norMix
### Title: Transform Clustering / Grouping to Normal Mixture
### Aliases: clus2norMix
### Keywords: cluster models

### ** Examples

x9 <- rnorMix(500, MW.nm9)
require("cluster")
pxc <- pam(x9, k=3)
plot(pxc, which = 2)# silhouette

(nm.p9 <- clus2norMix(pxc$clustering, x9))
plot(nm.p9, p.norm=FALSE)
lines(MW.nm9, col="thistle")



