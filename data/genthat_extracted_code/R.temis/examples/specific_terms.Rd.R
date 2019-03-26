library(R.temis)


### Name: specific_terms
### Title: specific_terms
### Aliases: specific_terms

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
specific_terms(dtm)




