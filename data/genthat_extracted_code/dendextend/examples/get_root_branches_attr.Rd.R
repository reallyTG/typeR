library(dendextend)


### Name: get_root_branches_attr
### Title: get attributes from the dendrogram's root(!) branches
### Aliases: get_root_branches_attr

### ** Examples

hc <- hclust(dist(USArrests[2:9,]), "com")
dend <- as.dendrogram(hc)

get_root_branches_attr(dend, "height") # 0.00000 71.96247
# plot(dend)
str(dend, 2)



