library(dendextend)


### Name: get_nodes_attr
### Title: Get attributes of dendrogram's nodes
### Aliases: get_nodes_attr

### ** Examples

# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)

# get_leaves_attr(dend) # error :)
get_leaves_attr(dend, "label")
labels(dend, "label")
get_leaves_attr(dend, "height") # should be 0's
get_nodes_attr(dend, "height") 


get_leaves_attr(dend, "leaf") # should be TRUE's
get_nodes_attr(dend, "leaf") # conatins NA's


get_leaves_attr(dend, "members") # should be 1's
get_nodes_attr(dend, "members", include_branches = FALSE, na.rm = TRUE) # 
get_nodes_attr(dend, "members") # 
get_nodes_attr(dend, "members",  simplify = FALSE)  
get_nodes_attr(dend, "members", include_leaves = FALSE, na.rm = TRUE) # 

get_nodes_attr(dend, "members",  id = c(1,3), simplify = FALSE)  
get_nodes_attr(dend, "members", id = c(1,3)) # 


hang_dend <- hang.dendrogram(dend)
get_leaves_attr(hang_dend, "height") # no longer 0!
get_nodes_attr(hang_dend, "height") # does not include any 0s!

# does not include leaves values:
get_nodes_attr(hang_dend, "height", include_leaves = FALSE) 
# remove leaves values all together:
get_nodes_attr(hang_dend, "height", include_leaves = FALSE, na.rm = TRUE) 



## Not run: 
##D library(microbenchmark)
##D # get_leaves_attr is twice faster than get_nodes_attr
##D microbenchmark(   get_leaves_attr(dend, "members"), # should be 1's
##D                     get_nodes_attr(dend, "members", include_branches = FALSE, na.rm = TRUE)
##D                )
## End(Not run)




