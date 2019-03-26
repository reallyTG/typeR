library(quanteda)


### Name: dfm_sort
### Title: Sort a dfm by frequency of one or more margins
### Aliases: dfm_sort

### ** Examples

dtm <- dfm(data_corpus_inaugural)
head(dtm)
head(dfm_sort(dtm))
head(dfm_sort(dtm, decreasing = FALSE, "both"))



