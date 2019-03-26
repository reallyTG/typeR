library(clv)


### Name: cls.stab.sim.ind
### Title: Cluster Stability - Similarity Index and Pattern-wise Stability
###   Approaches
### Aliases: cls.stab.sim.ind cls.stab.opt.assign
### Keywords: cluster

### ** Examples


# load and prepare data
library(clv)
data(iris)
iris.data <- iris[,1:4]

# fix arguments for cls.stab.* function
iter = c(2,3,4,5,6,7,9,12,15)
smp.num = 5
ratio = 0.8

res1 = cls.stab.sim.ind( iris.data, iter, rep.num=smp.num, subset.ratio=0.7,
                         sim.ind.type=c("rand","dot.pr","sim.ind") )
res2 = cls.stab.opt.assign( iris.data, iter, clust.method=c("hclust","kmeans"),
                             method.type=c("single","average") )

print(res1)
boxplot(res1$agnes.average$sim.ind)
plot(res2$hclust.single)




