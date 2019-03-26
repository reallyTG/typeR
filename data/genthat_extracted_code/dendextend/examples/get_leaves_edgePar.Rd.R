library(dendextend)


### Name: get_leaves_edgePar
### Title: Get edgePar of dendrogram's leaves
### Aliases: get_leaves_edgePar

### ** Examples

# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

# get_leaves_edgePar(dend) # error :)
get_leaves_edgePar(dend)
dend <- color_branches(dend, k = 3)
get_leaves_edgePar(dend)
get_leaves_edgePar(dend, TRUE)

dend <- dend %>% set("branches_lwd", c(2,1,2))
get_leaves_edgePar(dend)

plot(dend)




