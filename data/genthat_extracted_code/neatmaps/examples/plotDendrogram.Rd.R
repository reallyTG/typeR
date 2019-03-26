library(neatmaps)


### Name: plotDendrogram
### Title: Plot Dendrogram
### Aliases: plotDendrogram

### ** Examples

df <- netsDataFrame(net.attr.df = networkAttrDF,
                    node.attr.df = nodeAttrDF,
                    edge.df = edgeDF)
results <- neatmap(df, scale.df = "basic", mainTitle = "Heatmap", 
                    xlabel = "Chararacteritics", ylabel = "Networks",
                    link.method = "single", dist.method = "euclidean",
                    nBootRep = 10)
dendrogram <- results[[1]]
pvclustResults <- results[[3]]
dend <- plotDendrogram(dend = dendrogram, results = pvclustResults,
                       labelsCex = 0.5, pCex = 0.60, pAlpha = 0.95)




