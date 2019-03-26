library(biogram)


### Name: count_specified
### Title: Count specified n-grams
### Aliases: count_specified

### ** Examples

seqs <- matrix(c(1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 3, 4, 1, 2, 2, 4), nrow = 2)
count_specified(seqs, ngrams = c("1.1.1_0.0", "2.2.2_0.0", "1.1.2_0.0"))

seqs <- matrix(sample(1L:5, 200, replace = TRUE), nrow = 20)
count_specified(seqs, ngrams = c("2_4.2_0", "2_1.4_0", "3_1.3_0",
                                 "2_4.2_1", "2_1.4_1", "3_1.3_1",
                                 "2_4.2_2", "2_1.4_2", "3_1.3_2"))



