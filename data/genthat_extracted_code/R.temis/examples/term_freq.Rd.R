library(R.temis)


### Name: term_freq
### Title: term_freq
### Aliases: term_freq

### ** Examples


file <- system.file("texts", "reut21578-factiva.xml", package="tm.plugin.factiva")
corpus <- import_corpus(file, "factiva", language="en")
dtm <- build_dtm(corpus)
term_freq(dtm, "barrel")
term_freq(dtm, "barrel", meta(corpus)$Date)




