library(R.temis)


### Name: terms_graph
### Title: terms_graph
### Aliases: terms_graph

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
terms_graph(dtm, 100, 3)




