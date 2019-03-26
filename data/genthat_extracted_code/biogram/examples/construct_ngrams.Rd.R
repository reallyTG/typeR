library(biogram)


### Name: construct_ngrams
### Title: Construct and filter n-grams
### Aliases: construct_ngrams

### ** Examples

# to make the example faster, we run construct_ngrams() on the 
# subset of data
deg_seqs <- degenerate(human_cleave[c(1L:100, 801L:900), 1L:9],
list(`1` = c(1, 6, 8, 10, 11, 18),
     `2` = c(2, 13, 14, 16, 17),
     `3` = c(5, 19, 20),
     `4` = c(7, 9, 12, 15),
     '5' = c(3, 4)))
bigrams <- construct_ngrams(human_cleave[c(1L:100, 801L:900), "tar"], deg_seqs, 1L:5, 2)



