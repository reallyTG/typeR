library(cluster)


### Name: agnes.object
### Title: Agglomerative Nesting (AGNES) Object
### Aliases: agnes.object
### Keywords: cluster

### ** Examples

data(agriculture)
ag.ag <- agnes(agriculture)
class(ag.ag)
pltree(ag.ag) # the dendrogram

## cut the dendrogram -> get cluster assignments:
(ck3 <- cutree(ag.ag, k = 3))
(ch6 <- cutree(as.hclust(ag.ag), h = 6))
stopifnot(identical(unname(ch6), ck3))



