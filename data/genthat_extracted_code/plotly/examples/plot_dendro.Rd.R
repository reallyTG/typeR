library(plotly)


### Name: plot_dendro
### Title: Plot an interactive dendrogram
### Aliases: plot_dendro

### ** Examples


hc <- hclust(dist(USArrests), "ave")
dend1 <- as.dendrogram(hc)
plot_dendro(dend1, height = 600) %>% 
  hide_legend() %>% 
  highlight(persistent = TRUE, dynamic = TRUE)




