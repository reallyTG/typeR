library(factorMerger)


### Name: mergingHistory
### Title: Merging history
### Aliases: mergingHistory

### ** Examples

randSample <- generateMultivariateSample(N = 100, k = 10, d = 3)
fm <- mergeFactors(randSample$response, randSample$factor)
mergingHistory(fm, showStats = TRUE)



