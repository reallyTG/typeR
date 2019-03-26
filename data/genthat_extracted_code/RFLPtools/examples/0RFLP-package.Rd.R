library(RFLPtools)


### Name: RFLPtools-package
### Title: Tools to analyse RFLP-data
### Aliases: RFLPtools-package RFLPtools
### Keywords: package multivariate cluster

### ** Examples

data(RFLPdata)
res <- RFLPdist(RFLPdata)
plot(hclust(res[[1]]), main = "Euclidean distance")

par(mfrow = c(1,2))
plot(hclust(RFLPdist(RFLPdata, nrBands = 3)), cex = 0.7)
RFLPplot(RFLPdata, nrBands = 3, mar.bottom = 6, cex.axis = 0.8)

data(RFLPref)
RFLPrefplot(RFLPdata, RFLPref, nrBands = 6, cex.axis = 0.8)


library(MKmisc)
data(BLASTdata)
res <- simMatrix(BLASTdata, sequence.range = TRUE, Min = 500)
myCol <- colorRampPalette(brewer.pal(8, "RdYlGn"))(128)
simPlot(res, col = myCol, minVal = 0, 
        labels = colnames(res), title = "(Dis-)Similarity Plot")



