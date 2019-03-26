library(dendextend)


### Name: get_leaves_attr
### Title: Get/set attributes of dendrogram's leaves
### Aliases: get_leaves_attr

### ** Examples

# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)

# get_leaves_attr(dend) # error :)
get_leaves_attr(dend, "label")
labels(dend, "label")
get_leaves_attr(dend, "height") # should be 0's
get_nodes_attr(dend, "height") 

get_leaves_attr(dend, "nodePar") 
 

get_leaves_attr(dend, "leaf") # should be TRUE's
get_nodes_attr(dend, "leaf") # conatins NA's


get_leaves_attr(dend, "members") # should be 1's
get_nodes_attr(dend, "members") # 


get_leaves_attr(dend, "members",simplify = FALSE) # should be 1's





