library(KDViz)


### Name: KDSummary
### Title: Knowledge domain summary
### Aliases: KDSummary
### Keywords: kdviz knowledge domain mpa matrix

### ** Examples

data("KDCorpus")
mpaWords <- matrix.corpus.mpa(KDCorpus, fmin = 10, cmin = 1)

myKDSummary <- KDSummary(matrix.mpa = mpaWords, groupSize = 10)



