library(biogram)


### Name: create_ngrams
### Title: Get all possible n-Grams
### Aliases: create_ngrams

### ** Examples

# bigrams for standard aminoacids
create_ngrams(2, 1L:20)
# bigrams for standard aminoacids with positions, 10 amino acid long sequence, so 
# only 9 bigrams can be located in sequence
create_ngrams(2, 1L:20, 9)
# bigrams for DNA with positions, 10 nucleotide long sequence, distance 1, so only 
# 8 bigrams in sequence
# paste0 adds information about distance at the end of n-gram
paste0(create_ngrams(2, 1L:4, 8), "_0")



