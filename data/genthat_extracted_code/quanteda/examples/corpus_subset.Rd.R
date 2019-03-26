library(quanteda)


### Name: corpus_subset
### Title: Extract a subset of a corpus
### Aliases: corpus_subset
### Keywords: corpus

### ** Examples

summary(corpus_subset(data_corpus_inaugural, Year > 1980))
summary(corpus_subset(data_corpus_inaugural, Year > 1930 & President == "Roosevelt", 
                      select = Year))



