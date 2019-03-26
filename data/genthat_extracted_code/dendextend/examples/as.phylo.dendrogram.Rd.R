library(dendextend)


### Name: as.phylo.dendrogram
### Title: Convert a dendrogram into phylo
### Aliases: as.phylo.dendrogram

### ** Examples

## Not run: 
##D 
##D library(dendextend)
##D library(ape)
##D dend <- iris[1:30,-5] %>% dist %>% hclust %>% as.dendrogram
##D dend2 <- as.phylo(dend)
##D plot(dend2, type = "fan")
##D 
##D 
##D # Also possible to with ggplot2 :)
##D 
##D library(dendextend)
##D library(ggplot2)
##D library(ggdendro)
##D dend <- iris[1:30,-5] %>% dist %>% hclust %>% as.dendrogram
##D # Rectangular lines
##D ddata <- dend %>% dendro_data(type = "rectangle")
##D p <- ggplot(segment(ddata)) + 
##D    geom_segment(aes(x = x, y = y, xend = xend, yend = yend)) + 
##D    coord_flip() + 
##D    scale_y_reverse(expand = c(0.2, 0)) + coord_polar(theta="x")
##D p
##D 
##D 
##D 
## End(Not run)


# see: https://github.com/klutometis/roxygen/issues/796
# 




