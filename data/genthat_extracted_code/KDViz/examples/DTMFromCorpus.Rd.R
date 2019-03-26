library(KDViz)


### Name: DTMFromCorpus
### Title: Obtain a document-term matrix from corpus
### Aliases: DTMFromCorpus
### Keywords: dtm corpus document-term matrix

### ** Examples

data("KDVizData")
data("KDCorpus")

myDTM <- DTMFromCorpus(corpus = KDCorpus, rowNames = row.names(KDVizData))



