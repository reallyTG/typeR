library(tm)


### Name: tm_combine
### Title: Combine Corpora, Documents, Term-Document Matrices, and Term
###   Frequency Vectors
### Aliases: c.VCorpus c.TextDocument c.TermDocumentMatrix c.term_frequency

### ** Examples

data("acq")
data("crude")
meta(acq, "comment", type = "corpus") <- "Acquisitions"
meta(crude, "comment", type = "corpus") <- "Crude oil"
meta(acq, "acqLabels") <- 1:50
meta(acq, "jointLabels") <- 1:50
meta(crude, "crudeLabels") <- letters[1:20]
meta(crude, "jointLabels") <- 1:20
c(acq, crude)
meta(c(acq, crude), type = "corpus")
meta(c(acq, crude))
c(acq[[30]], crude[[10]])
c(TermDocumentMatrix(acq), TermDocumentMatrix(crude))



