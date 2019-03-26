library(RFLPtools)


### Name: RFLPdist
### Title: Compute distances for RFLP data.
### Aliases: RFLPdist
### Keywords: multivariate cluster

### ** Examples

## Euclidean distance
data(RFLPdata)
res <- RFLPdist(RFLPdata)
names(res) ## number of bands
res$"6"

RFLPdist(RFLPdata, nrBands = 6)

## Other distances
res1 <- RFLPdist(RFLPdata, distfun = function(x) dist(x, method = "manhattan"))
res2 <- RFLPdist(RFLPdata, distfun = function(x) dist(x, method = "maximum"))
res[[1]]
res1[[1]]
res2[[1]]

## cut dendrogram at height 50
clust4bd <- hclust(res[[2]])
cgroups50 <- cutree(clust4bd, h=50)
cgroups50

## or
library(MKmisc)
res3 <- RFLPdist(RFLPdata, distfun = corDist)
res3$"9"

## hierarchical clustering
par(mfrow = c(2,2))
plot(hclust(res[[1]]), main = "Euclidean distance")
plot(hclust(res1[[1]]), main = "Manhattan distance")
plot(hclust(res2[[1]]), main = "Maximum distance")
plot(hclust(res3[[1]]), main = "Pearson correlation distance")


## Similarity matrix
library(MKmisc)
myCol <- colorRampPalette(brewer.pal(8, "RdYlGn"))(128)
ord <- order.dendrogram(as.dendrogram(hclust(res[[1]])))
temp <- as.matrix(res[[1]])
simPlot(temp[ord,ord], col = rev(myCol), minVal = 0, 
        labels = colnames(temp), title = "(Dis-)Similarity Plot")


## or
library(lattice)
levelplot(temp[ord,ord], col.regions = rev(myCol),
          at = do.breaks(c(0, max(temp)), 128),
          xlab = "", ylab = "",
          ## Rotate label of x axis
          scales = list(x = list(rot = 90)),
          main = "(Dis-)Similarity Plot")

## multidimensional scaling
loc <- cmdscale(res[[5]])
x <- loc[,1]
y <- -loc[,2]
plot(x, y, type="n", xlab="", ylab="", xlim = 1.05*range(x), main="Multidemsional scaling")
text(x, y, rownames(loc), cex=0.8)



