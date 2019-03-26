library(R.temis)


### Name: combine_terms
### Title: combine_terms
### Aliases: combine_terms

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
dict <- dictionary(dtm)
combine_terms(dtm, dict)




