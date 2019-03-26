library(quanteda)


### Name: metadoc
### Title: Get or set document-level meta-data
### Aliases: metadoc metadoc<-
### Keywords: corpus

### ** Examples

mycorp <- corpus_subset(data_corpus_inaugural, Year > 1990)
summary(mycorp, showmeta = TRUE)
metadoc(mycorp, "encoding") <- "UTF-8"
metadoc(mycorp)
metadoc(mycorp, "language") <- "english"
summary(mycorp, showmeta = TRUE)



