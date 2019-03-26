library(sampSurf)


### Name: mcsContainer
### Title: Generate Objects of Class "'mcsContainer'"
### Aliases: mcsContainer
### Keywords: ~kwd1 ~kwd2

### ** Examples

sTrees = standingTrees(5, startSeed = 12)
sTrees.cmc = crudeMonteCarlo(sTrees, n.s = 10)
sTrees.cmc
print(sTrees.cmc@stats, digits = 4)



