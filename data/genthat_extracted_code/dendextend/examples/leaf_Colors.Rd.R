library(dendextend)


### Name: leaf_Colors
### Title: Return the leaf Colors of a dendrogram
### Aliases: leaf_Colors leaf_colors

### ** Examples

dend <- USArrests %>% dist %>% hclust(method = "ave") %>% as.dendrogram
d5=color_branches(dend,5)
leaf_Colors(d5)



