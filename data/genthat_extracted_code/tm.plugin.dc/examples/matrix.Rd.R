library(tm.plugin.dc)


### Name: TermDocumentMatrix.DCorpus
### Title: Term-Document Matrix from Distributed Corpora
### Aliases: TermDocumentMatrix.DCorpus

### ** Examples

data("crude")
tdm <- TermDocumentMatrix(as.DCorpus(crude),
                          list(stopwords = TRUE, weighting = weightTfIdf))
inspect(tdm[149:152,1:5])



