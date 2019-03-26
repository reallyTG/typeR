library(biogram)


### Name: count_total
### Title: Count total number of n-grams
### Aliases: count_total

### ** Examples

seqs <- matrix(sample(1L:4, 600, replace = TRUE), ncol = 50)
# make several sequences shorter by replacing them partially with NA
seqs[8L:11, 46L:50] <- NA
seqs[1L, 31L:50] <- NA
count_total(seqs, 3, c(1, 0))



