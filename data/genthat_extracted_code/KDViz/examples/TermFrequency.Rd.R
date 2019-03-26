library(KDViz)


### Name: TermFrequency
### Title: Table of word frequencies inside a text corpus or a
###   document-term matrix
### Aliases: TermFrequency
### Keywords: term frequency dtm frequency corpus frequency

### ** Examples

data("KDCorpus")

termFreqTable <- TermFrequency(KDCorpus)
head(termFreqTable, 100)



