library(textmining)


### Name: ngram
### Title: Function to create ngram docs
### Aliases: ngram

### ** Examples

corp <- tmCorpus(c("This is first document", "This is second"))
parsed_ngrams <- ngram(corp, k = 2)
tabled <- make_tabled(parsed_ngrams)
content(tabled)




