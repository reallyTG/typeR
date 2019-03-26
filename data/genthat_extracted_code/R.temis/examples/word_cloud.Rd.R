library(R.temis)


### Name: word_cloud
### Title: word_cloud
### Aliases: word_cloud

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
word_cloud(dtm)




