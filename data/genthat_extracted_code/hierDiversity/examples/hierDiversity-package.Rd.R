library(hierDiversity)


### Name: hierDiversity-package
### Title: Hierarchical Multiplicative Partitioning of Diversity and
###   Complexity
### Aliases: hierDiversity-package
### Keywords: package multivariate phenotypic complexity diversity
###   community ecology evolution

### ** Examples

set.seed(2)
dat <- matrix(rpois(100, lambda = 3), nrow = 10)
dz(abundances = dat, lev = "beta", q = 2)
#1.336

#Create Grouping Matrix
group <- as.matrix(data.frame(
  L1 = rep(c("A","B","C","D","E"), each=2),
  L2 = rep(c("AB", "CDE"), times=c(4,6)),
  L3 = rep("total",10)))

hierDiversity(dat, group, reps=9)




