library(sampSurf)


### Name: antitheticSampling
### Title: Generate Objects of Class "'antitheticSampling'"
### Aliases: antitheticSampling
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# estimate volume between 10 and 15 m, using 5 random heights...
#
sTree = standingTree(dbh = 40, topDiam = 0, height = 20, solidType = 2.8)
sTree.cmc = crudeMonteCarlo(sTree, n.s = 5, segBnds = c(10,15), startSeed = 114)
sTree.anti = antitheticSampling(sTree.cmc)
sTree.anti



