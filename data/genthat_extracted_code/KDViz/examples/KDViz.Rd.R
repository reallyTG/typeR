library(KDViz)


### Name: KDViz
### Title: Knowledge Domain Visualization
### Aliases: KDViz
### Keywords: kdviz knowledge domain visualization

### ** Examples

data("KDCorpus")
mpaWords <- matrix.corpus.mpa(KDCorpus, fmin = 10, cmin = 1)
myKDSummary <- KDSummary(matrix.mpa = mpaWords, groupSize = 10)
data("KDDTM")
myWordGroupDTM <- GroupDTM(dtm = KDDTM, kdSummary = myKDSummary)

KDViz(groupDTM = myWordGroupDTM, group = 1, export = TRUE)



