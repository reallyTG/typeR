library(R.temis)


### Name: extreme_docs
### Title: extreme_docs
### Aliases: extreme_docs

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
ca <- corpus_ca(corpus, dtm)
contributive_docs(corpus, ca, 1)

# Also works when terms have been combined
dict <- dictionary(dtm)
dtm2 <- combine_terms(dtm, dict)
ca2 <- corpus_ca(corpus, dtm2)
extreme_docs(corpus, ca2, 1)




