library(quanteda)


### Name: tokens_sample
### Title: Randomly sample documents from a tokens object
### Aliases: tokens_sample
### Keywords: tokens

### ** Examples

set.seed(10)
toks <- tokens(data_corpus_inaugural[1:10])
head(toks)
head(tokens_sample(toks))
head(tokens_sample(toks, replace = TRUE))



