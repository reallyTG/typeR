library(KDViz)


### Name: GroupDTM
### Title: Grouping of words with co-word method
### Aliases: GroupDTM
### Keywords: dtm word grouping

### ** Examples

data("KDCorpus")
data("KDDTM")
mpaWords <- matrix.corpus.mpa(KDCorpus, fmin = 10, cmin = 1)
myKDSummary <- KDSummary(matrix.mpa = mpaWords, groupSize = 10)

myWordGroupDTM <- GroupDTM(dtm = KDDTM, kdSummary = myKDSummary)



