library(EnsCat)


### Name: ggdplot
### Title: Nice plots of hierarchical clustering results via ggdendrogram
### Aliases: ggdplot

### ** Examples


library(ggplot2)
hc <- hclust(dist(USArrests), "ave")
p<-ggdplot(hc, ptype=2)



