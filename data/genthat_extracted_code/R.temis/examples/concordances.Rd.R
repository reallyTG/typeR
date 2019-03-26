library(R.temis)


### Name: concordances
### Title: concordances
### Aliases: concordances

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
concordances(corpus, dtm, "oil")
concordances(corpus, dtm, c("oil", "opec"))
concordances(corpus, dtm, c("oil", "opec"), all=TRUE)

# Also works when terms have been combined
dict <- dictionary(dtm)
dtm2 <- combine_terms(dtm, dict)
concordances(corpus, dtm2, "product")




