library(alakazam)


### Name: pairwiseEqual
### Title: Calculate pairwise equivalence between sequences
### Aliases: pairwiseEqual

### ** Examples

# Gaps and Ns will match any character
seq <- c(A="ATGGC", B="ATGGG", C="ATGGG", D="AT--C", E="NTGGG")
d <- pairwiseEqual(seq)
rownames(d) <- colnames(d) <- seq
d




