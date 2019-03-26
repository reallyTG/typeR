library(dendextend)


### Name: labels_colors
### Title: Retrieve/assign colors to the labels of a dendrogram
### Aliases: labels_colors labels_col labels_colors<-

### ** Examples

# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)

# Defaults:
labels_colors(dend)
plot(dend)

# let's add some color:
labels_colors(dend) <- 2:4
labels_colors(dend)
plot(dend)
   
   
   # doesn't work...
 #  get_nodes_attr(dend, "nodePar", include_branches = FALSE)

# changing color to black
labels_colors(dend) <- 1
labels_colors(dend)
plot(dend)

# removing color (and the nodePar completely - if it has no other attributed but lab.col)
labels_colors(dend) <- NULL
labels_colors(dend)
plot(dend)



