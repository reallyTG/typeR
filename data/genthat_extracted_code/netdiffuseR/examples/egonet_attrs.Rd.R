library(netdiffuseR)


### Name: egonet_attrs
### Title: Retrieve alter's attributes (network effects)
### Aliases: egonet_attrs

### ** Examples

# Simple example with diffnet -----------------------------------------------
set.seed(1001)
diffnet <- rdiffnet(150, 5, seed.graph="small-world")

# Adding attributes
indeg <- dgr(diffnet, cmode="indegree")
head(indeg)
diffnet[["indegree"]] <- indeg

# Retrieving egonet's attributes (vertices 1 and 20)
egonet_attrs(diffnet, V=c(1,20))

# Example with a static network ---------------------------------------------

set.seed(1231)
n <- 20
net <- rgraph_ws(n = n, k = 4, p = .5)
someattr <- matrix(rnorm(n * 2), ncol= 2, dimnames = list(NULL, c("a", "b")))

# Maximum of -a- in ego network
ans <- egonet_attrs(net, someattr, fun = function(x) max(x[,"a"]))
ans

# checking it worked, taking a look at node 1, 2, and 3
max(someattr[which(net[1,] == 1),"a"]) == ans[1] # TRUE
max(someattr[which(net[2,] == 1),"a"]) == ans[2] # TRUE
max(someattr[which(net[3,] == 1),"a"]) == ans[3] # TRUE





