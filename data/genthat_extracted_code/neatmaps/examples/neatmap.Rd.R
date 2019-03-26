library(neatmaps)


### Name: neatmap
### Title: Heatmap of Networks
### Aliases: neatmap

### ** Examples

df <- netsDataFrame(net.attr.df = networkAttrDF,
                    node.attr.df = nodeAttrDF,
                    edge.df = edgeDF)
heatmap <- neatmap(df, scale.df = "basic", mainTitle = "Heatmap", 
                   xlabel = "Chararacteritics", ylabel = "Networks",
                   link.method = "single", dist.method = "euclidean",
                   nBootRep = 10)




