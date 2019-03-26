library(textreuse)


### Name: tokenize
### Title: Recompute the tokens for a document or corpus
### Aliases: tokenize

### ** Examples

dir <- system.file("extdata/legal", package = "textreuse")
corpus <- TextReuseCorpus(dir = dir, tokenizer = NULL)
corpus <- tokenize(corpus, tokenize_ngrams)
head(tokens(corpus[[1]]))



