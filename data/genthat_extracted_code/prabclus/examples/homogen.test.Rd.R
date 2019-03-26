library(prabclus)


### Name: homogen.test
### Title: Classical distance-based test for homogeneity against clustering
### Aliases: homogen.test
### Keywords: cluster htest

### ** Examples

options(digits=4)
data(kykladspecreg)
j <- jaccard(t(kykladspecreg))
homogen.test(j, testdist="erdos")
homogen.test(j, testdist="ling")



