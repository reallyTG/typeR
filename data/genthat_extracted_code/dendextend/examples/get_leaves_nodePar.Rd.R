library(dendextend)


### Name: get_leaves_nodePar
### Title: Get nodePar of dendrogram's leaves
### Aliases: get_leaves_nodePar

### ** Examples

# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)

# get_leaves_attr(dend) # error :)
get_leaves_nodePar(dend)
labels_colors(dend) <- 1:3
get_leaves_nodePar(dend)

dend <- assign_values_to_leaves_nodePar(dend, 2, "lab.cex")
get_leaves_nodePar(dend)

plot(dend)




