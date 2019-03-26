library(sampSurf)


### Name: importanceSampling
### Title: Generate Objects of Class "'importanceSampling'"
### Aliases: importanceSampling
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# estimate volume between 10 and 15 m, using 5 random heights...
#
sTree = standingTree(dbh = 40, topDiam = 0, height = 20, solidType = 2.8)
sTree.is = importanceSampling(sTree, n.s = 5, segBnds = c(10,15), startSeed = 114,
           proxy = 'wbProxy', solidTypeProxy = 2.5)
sTree.is



