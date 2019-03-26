library(R.temis)


### Name: corpus_clustering
### Title: corpus_clustering
### Aliases: corpus_clustering

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
res <- corpus_ca(corpus, dtm, ncp=2, sparsity=0.98)
corpus_clustering(res, 3)




