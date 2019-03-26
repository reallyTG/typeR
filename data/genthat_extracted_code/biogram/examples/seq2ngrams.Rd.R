library(biogram)


### Name: seq2ngrams
### Title: Extract n-grams from sequence
### Aliases: seq2ngrams

### ** Examples

# trigrams from multiple sequences
seqs <- matrix(sample(1L:4, 600, replace = TRUE), ncol = 50)
seq2ngrams(seqs, 3, 1L:4)



