library(bmotif)


### Name: mcount
### Title: Count bipartite motifs
### Aliases: mcount

### ** Examples

set.seed(123)
row <- 10
col <- 10
m <- matrix(sample(0:1, row*col, replace=TRUE), row, col)
mcount(M = m, six_node = TRUE, normalise = TRUE)



