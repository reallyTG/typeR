library(R.temis)


### Name: split_documents
### Title: split_documents
### Aliases: split_documents

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
split_documents(corpus, 3)




