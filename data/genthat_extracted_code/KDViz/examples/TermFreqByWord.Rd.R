library(KDViz)


### Name: TermFreqByWord
### Title: Search a specific term inside a table of word frequencies
### Aliases: TermFreqByWord
### Keywords: word frequency

### ** Examples

data("KDCorpus")
termFreqTable <- TermFrequency(KDCorpus)

TermFreqByWord(termFreqTable = termFreqTable, word = "graph")



