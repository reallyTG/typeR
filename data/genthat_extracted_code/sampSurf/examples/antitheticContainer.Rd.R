library(sampSurf)


### Name: antitheticContainer
### Title: Generate Objects of Class "'antitheticContainer'"
### Aliases: antitheticContainer
### Keywords: ~kwd1 ~kwd2

### ** Examples

sTrees = standingTrees(5, startSeed = 12)
sTrees.cmc = crudeMonteCarlo(sTrees, n.s = 10)
sTrees.anti = antitheticSampling(sTrees.cmc)
sTrees.anti
print(sTrees.anti@stats, digits = 4) #compare with cmc below
print(sTrees.cmc@stats, digits = 4)



