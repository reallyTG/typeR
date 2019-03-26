library(Cluster.OBeu)


### Name: cl.summary
### Title: Extract the proposed clustering method and the number of
###   clusters from clvalid method
### Aliases: cl.summary

### ** Examples

cl.data = nums(city_data)
method_clvalid = clValid::clValid(as.matrix(cl.data), 2:4,
                                  clMethods = c("pam", "kmeans"),
                                  validation = c("internal","stability"),
                                  metric = "euclidean")
cl.meth = cl.summary(method_clvalid)
cl.meth



