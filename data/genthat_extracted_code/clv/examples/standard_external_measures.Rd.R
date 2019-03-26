library(clv)


### Name: std.ext
### Title: Standard External Measures: Rand index, Jaccard coefficient etc.
### Aliases: std.ext clv.Rand clv.Jaccard clv.Folkes.Mallows clv.Phi
###   clv.Russel.Rao
### Keywords: cluster

### ** Examples

# load and prepare data
library(clv)
data(iris)
iris.data <- iris[,1:4]

# cluster data
pam.mod <- pam(iris.data,3) # create three clusters
v.pred <- as.integer(pam.mod$clustering) # get cluster ids associated to given data objects
v.real <- as.integer(iris$Species) # get also real cluster ids

# compare true clustering with those given by the algorithm
# 1. optimal solution:

# use only once std.ext function
std <- std.ext(v.pred, v.real)
# to compute three indicies based on std.ext result
rand1 <- clv.Rand(std)
jaccard1 <- clv.Jaccard(std)
folk.mal1 <- clv.Folkes.Mallows(std)

# 2. functional solution:

# prepare set of functions which compare two clusterizations
Rand <- function(clust1,clust2) clv.Rand(std.ext(clust1,clust2))
Jaccard <- function(clust1,clust2) clv.Jaccard(std.ext(clust1,clust2))
Folkes.Mallows <- function(clust1,clust2) clv.Folkes.Mallows(std.ext(clust1,clust2))

# compute indicies
rand2 <- Rand(v.pred,v.real)
jaccard2 <- Jaccard(v.pred,v.real)
folk.mal2 <- Folkes.Mallows(v.pred,v.real)



