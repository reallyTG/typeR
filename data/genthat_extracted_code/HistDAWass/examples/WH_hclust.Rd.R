library(HistDAWass)


### Name: WH_hclust
### Title: Hierarchical clustering of histogram data
### Aliases: WH_hclust

### ** Examples

results=WH_hclust(x = BLOOD,simplify = TRUE, method="complete")
plot(results) # it plots the dendrogram
cutree(results,k = 5) # it returns the labels for 5 clusters



