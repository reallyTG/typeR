library(R.temis)


### Name: build_dtm
### Title: build_dtm
### Aliases: build_dtm

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
build_dtm(corpus)




