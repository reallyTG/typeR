library(R.temis)


### Name: set_corpus_variables
### Title: set_corpus_variables
### Aliases: set_corpus_variables

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
dset <- data.frame(x=1:length(corpus))
corpus <- set_corpus_variables(corpus, dset)




