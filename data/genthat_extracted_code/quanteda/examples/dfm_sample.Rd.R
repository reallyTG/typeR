library(quanteda)


### Name: dfm_sample
### Title: Randomly sample documents or features from a dfm
### Aliases: dfm_sample
### Keywords: dfm

### ** Examples

set.seed(10)
myDfm <- dfm(data_corpus_inaugural[1:10])
head(myDfm)
head(dfm_sample(myDfm))
head(dfm_sample(myDfm, replace = TRUE))
head(dfm_sample(myDfm, margin = "features"))



