library(corpus)


### Name: term_stats
### Title: Term Statistics
### Aliases: term_stats

### ** Examples

term_stats("A rose is a rose is a rose.")

# remove punctuation and English stop words
term_stats("A rose is a rose is a rose.",
           text_filter(drop_symbol = TRUE, drop = stopwords_en))

# unigrams, bigrams, and trigrams
term_stats("A rose is a rose is a rose.", ngrams = 1:3)

# also include the type information
term_stats("A rose is a rose is a rose.", ngrams = 1:3, types = TRUE)



