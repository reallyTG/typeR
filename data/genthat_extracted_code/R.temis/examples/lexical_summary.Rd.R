library(R.temis)


### Name: lexical_summary
### Title: lexical_summary
### Aliases: lexical_summary

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
lexical_summary(dtm, corpus)




