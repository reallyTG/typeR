library(R.temis)


### Name: add_clusters
### Title: add_clusters
### Aliases: add_clusters

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
res <- corpus_ca(corpus, dtm, ncp=2, sparsity=0.98)
clust <- corpus_clustering(res, 3)
corpus <- add_clusters(corpus, clust)
meta(corpus)




