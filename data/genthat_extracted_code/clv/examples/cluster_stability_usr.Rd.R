library(clv)


### Name: cls.stab.sim.ind.usr
### Title: Cluster Stability - Similarity Index and Pattern-wise Stability
###   Approaches with User Defined Cluster Algorithms
### Aliases: cls.stab.sim.ind.usr cls.stab.opt.assign.usr cls.alg
### Keywords: cluster

### ** Examples


# load and prepare data
library(clv)
data(iris)
iris.data <- iris[,1:4]

# example of wrapper for partitioning algorithm 
pam.clust <- function(data, clust.num) pam(data, clust.num, cluster.only=TRUE)

# example of wrapper for hierarchical algorithm
cutree.wrap <- function(clust.res, clust.num)  cutree(clust.res, clust.num)
agnes.single <- function(data) agnes(data, method="single") 

# converting hierarchical algorithm to partitioning one
agnes.part1 <- function(data, clust.num) cutree.wrap( agnes.single(data), clust.num )
# the same using "cls.alg"
agnes.part2 <- cls.alg(agnes.single, cutree.wrap, fast=FALSE)

# fix arguments for cls.stab.* function
iter = c(2,4,5,7,9,12,15)

res1 = cls.stab.sim.ind.usr( iris.data, iter, pam.clust, 
    sim.ind.type=c("rand","dot.pr","sim.ind"), rep.num=5, subset.ratio=0.7 )
res2 = cls.stab.opt.assign.usr( iris.data, iter, clust.alg=cls.alg(agnes.single, cutree.wrap) )

res3 = cls.stab.sim.ind.usr( iris.data, iter, agnes.part1,
     sim.ind.type=c("rand","dot.pr","sim.ind"), rep.num=5, subset.ratio=0.7 )
res4 = cls.stab.opt.assign.usr( iris.data, iter, clust.alg=agnes.part2 )

print(res1)
boxplot(res1$sim.ind)
plot(res2)





