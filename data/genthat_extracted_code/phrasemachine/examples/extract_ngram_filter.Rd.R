library(phrasemachine)


### Name: extract_ngram_filter
### Title: Extract phrase spans
### Aliases: extract_ngram_filter

### ** Examples

pos_tags <- c("VB", "JJ", "NN", "NN")
spans <- extract_ngram_filter(pos_tags,
                              regex = "(A|N)*N(PD*(A|N)*N)*",
                              maximum_ngram_length = 8,
                              minimum_ngram_length = 1)



