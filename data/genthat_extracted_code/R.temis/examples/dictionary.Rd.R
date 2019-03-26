library(R.temis)


### Name: dictionary
### Title: dictionary
### Aliases: dictionary

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
dictionary(dtm)




