library(textreuse)


### Name: tokenizers
### Title: Split texts into tokens
### Aliases: tokenize_ngrams tokenize_sentences tokenize_skip_ngrams
###   tokenize_words tokenizers

### ** Examples

dylan <- "How many roads must a man walk down? The answer is blowin' in the wind."
tokenize_words(dylan)
tokenize_sentences(dylan)
tokenize_ngrams(dylan, n = 2)
tokenize_skip_ngrams(dylan, n = 3, k = 2)



