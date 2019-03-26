library(dendextend)


### Name: fix_members_attr.dendrogram
### Title: Fix members attr in a dendrogram
### Aliases: fix_members_attr.dendrogram

### ** Examples


# define dendrogram object to play with:
hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)
# plot(dend)
# prune one leaf
dend[[2]] <- dend[[2]][[1]]
# plot(dend)
dend # but it is NO LONGER true that it has 3 members total!
fix_members_attr.dendrogram(dend) # it now knows it has only 2 members :)

hc <- hclust(dist(USArrests[1:3,]), "ave")
dend <- as.dendrogram(hc)

identical(prune_leaf(dend , "Alaska"), fix_members_attr.dendrogram(prune_leaf(dend , "Alaska")))
str(unclass(prune_leaf(dend , "Alaska")))
str(unclass(fix_members_attr.dendrogram(prune_leaf(dend , "Alaska"))))



