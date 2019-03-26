library(R.temis)


### Name: subset_corpus
### Title: subset_corpus
### Aliases: subset_corpus

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
subset_corpus(corpus, dtm, "barrel")
subset_corpus(corpus, dtm, c("barrel", "opec"))
subset_corpus(corpus, dtm, c("barrel", "opec"), exclude=TRUE)
subset_corpus(corpus, dtm, c("barrel", "opec"), all=TRUE)




