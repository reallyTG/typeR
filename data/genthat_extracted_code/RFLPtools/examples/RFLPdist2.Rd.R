library(RFLPtools)


### Name: RFLPdist2
### Title: Compute distances for RFLP data.
### Aliases: RFLPdist2
### Keywords: multivariate cluster

### ** Examples

## Euclidean distance
data(RFLPdata)
nrBands(RFLPdata)
res0 <- RFLPdist(RFLPdata, nrBands = 4)
res1 <- RFLPdist2(RFLPdata, nrBands = 4, nrMissing = 1)
res2 <- RFLPdist2(RFLPdata, nrBands = 4, nrMissing = 2)
res3 <- RFLPdist2(RFLPdata, nrBands = 4, nrMissing = 3)

## assume missing bands only below LOD
res1.lod <- RFLPdist2(RFLPdata, nrBands = 4, nrMissing = 1, LOD = 60)

## hierarchical clustering
par(mfrow = c(2,2))
plot(hclust(res0), main = "0 bands missing")
plot(hclust(res1), main = "1 band missing")
plot(hclust(res2), main = "2 bands missing")
plot(hclust(res3), main = "3 bands missing")

## missing bands only below LOD
par(mfrow = c(1,2))
plot(hclust(res0), main = "0 bands missing")
plot(hclust(res1.lod), main = "1 band missing below LOD")

## Similarity matrix
library(MKmisc)
myCol <- colorRampPalette(brewer.pal(8, "RdYlGn"))(128)
ord <- order.dendrogram(as.dendrogram(hclust(res1)))
temp <- as.matrix(res1)
simPlot(temp[ord,ord], col = rev(myCol), minVal = 0, 
        labels = colnames(temp), title = "(Dis-)Similarity Plot")

## missing bands only below LOD
ord <- order.dendrogram(as.dendrogram(hclust(res1.lod)))
temp <- as.matrix(res1.lod)
simPlot(temp[ord,ord], col = rev(myCol), minVal = 0, 
        labels = colnames(temp), title = "(Dis-)Similarity Plot\n1 band missing below LOD")


## or
library(lattice)
levelplot(temp[ord,ord], col.regions = rev(myCol),
          at = do.breaks(c(0, max(temp)), 128),
          xlab = "", ylab = "",
          ## Rotate label of x axis
          scales = list(x = list(rot = 90)),
          main = "(Dis-)Similarity Plot")


## Other distances
res11 <- RFLPdist2(RFLPdata, distfun = function(x) dist(x, method = "manhattan"),
                 nrBands = 4, nrMissing = 1)
res12 <- RFLPdist2(RFLPdata, distfun = corDist, nrBands = 4, nrMissing = 1)
res13 <- RFLPdist2(RFLPdata, distfun = corDist, nrBands = 4, nrMissing = 1, LOD = 60)
par(mfrow = c(2,2))
plot(hclust(res1), main = "Euclidean distance\n1 band missing")
plot(hclust(res11), main = "Manhattan distance\n1 band missing")
plot(hclust(res12), main = "Pearson correlation distance\n1 band missing")
plot(hclust(res13), main = "Pearson correlation distance\n1 band missing below LOD")



