library(topicmodels)


### Name: ldaformat2dtm
### Title: Transform data from and for use with the 'lda' package
### Aliases: ldaformat2dtm dtm2ldaformat
### Keywords: utilities

### ** Examples

if (require("lda")) {
  data("cora.documents", package = "lda")
  data("cora.vocab", package = "lda")
  dtm <- ldaformat2dtm(cora.documents, cora.vocab)
  cora <- dtm2ldaformat(dtm)
  all.equal(cora, list(documents = cora.documents,
                       vocab = cora.vocab))
}



