library(R.temis)


### Name: corpus_ca
### Title: corpus_ca
### Aliases: corpus_ca

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
corpus_ca(corpus, dtm, ncp=3, sparsity=0.98)




