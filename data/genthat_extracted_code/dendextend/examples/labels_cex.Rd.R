library(dendextend)


### Name: labels_cex
### Title: Retrieve/assign cex to the labels of a dendrogram
### Aliases: labels_cex labels_cex<-

### ** Examples

# define dendrogram object to play with:
dend <- as.dendrogram(hclust(dist(USArrests[1:3,]), "ave"))

# Defaults:
labels_cex(dend)
plot(dend)

# let's add some color:
labels_cex(dend) <- 1:3
labels_cex(dend)
plot(dend)
   
labels_cex(dend) <- 1
labels_cex(dend)
plot(dend)




