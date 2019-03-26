library(R.temis)


### Name: frequent_terms
### Title: frequent_terms
### Aliases: frequent_terms

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
frequent_terms(dtm)




