library(biogram)


### Name: count_multigrams
### Title: Detect and count multiple n-grams in sequences
### Aliases: count_multigrams

### ** Examples

seqs <- matrix(sample(1L:4, 600, replace = TRUE), ncol = 50)
count_multigrams(c(3, 1), list(c(1, 0), 0), seqs, 1L:4, pos = TRUE)
# if ds parameter is not present, n-grams are calculated for distance 0
count_multigrams(c(3, 1), seq = seqs, u = 1L:4)

# calculate three times n-gram with the same length, but different distances between
# elements
count_multigrams(c(4, 4, 4), list(c(2, 0, 1), c(2, 1, 0), c(0, 1, 2)), 
                 seqs, 1L:4, pos = TRUE)



