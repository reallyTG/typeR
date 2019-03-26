library(R.temis)


### Name: cooc_terms
### Title: cooc_terms
### Aliases: cooc_terms

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
cooc_terms(dtm, "barrel")
cooc_terms(dtm, "barrel", meta(corpus)$Date)




