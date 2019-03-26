library(prabclus)


### Name: distratio
### Title: Distance ratio test statistics for distance based clustering
### Aliases: distratio
### Keywords: cluster

### ** Examples

options(digits=4)
data(kykladspecreg)
j <- jaccard(t(kykladspecreg))
distratio(j)



