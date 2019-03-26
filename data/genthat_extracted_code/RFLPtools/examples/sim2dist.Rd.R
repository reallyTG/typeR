library(RFLPtools)


### Name: sim2dist
### Title: Convert similarity matrix to dist object.
### Aliases: sim2dist
### Keywords: multivariate cluster

### ** Examples

data(BLASTdata)

## without sequence range
## Not run: 
##D res <- simMatrix(BLASTdata)
## End(Not run)

## with sequence range
range(BLASTdata$alignment.length)
res1 <- simMatrix(BLASTdata, sequence.range = TRUE, Min = 100, Max = 450)
res2 <- simMatrix(BLASTdata, sequence.range = TRUE, Min = 500)

## visualize similarity matrix
library(MKmisc)
simPlot(res2, minVal = 0, 
        labels = colnames(res2), title = "(Dis-)Similarity Plot")


## or
library(lattice)
myCol <- colorRampPalette(brewer.pal(8, "RdYlGn"))(128)
levelplot(res2, col.regions = myCol,
          at = do.breaks(c(0, max(res2)), 128),
          xlab = "", ylab = "",
          ## Rotate label of x axis
          scales = list(x = list(rot = 90)),
          main = "(Dis-)Similarity Plot")

## convert to distance
res.d <- sim2dist(res2)

## hierarchical clustering
plot(hclust(res.d))



