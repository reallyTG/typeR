library(quanteda)


### Name: settings
### Title: Get or set the corpus settings
### Aliases: settings settings.default settings.corpus settings<-
###   settings.dfm
### Keywords: internal settings

### ** Examples

settings(data_corpus_inaugural, "stopwords")
(tempdfm <- dfm(corpus_subset(data_corpus_inaugural, Year>1980), verbose=FALSE))
(tempdfmSW <- dfm(corpus_subset(data_corpus_inaugural, Year>1980),
                 remove = stopwords("english"), verbose=FALSE))
settings(data_corpus_inaugural, "stopwords") <- TRUE
tempdfm <- dfm(data_corpus_inaugural, stem=TRUE, verbose=FALSE)
settings(tempdfm)



