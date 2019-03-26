library(factorMerger)


### Name: groupsStats
### Title: Groups statistic
### Aliases: groupsStats

### ** Examples

randSample <- generateMultivariateSample(N = 100, k = 10, d = 3)
fm <- mergeFactors(randSample$response, randSample$factor)
groupsStats(fm)




