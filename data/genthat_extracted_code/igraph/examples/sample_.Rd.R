library(igraph)


### Name: sample_
### Title: Sample from a random graph model
### Aliases: sample_

### ** Examples

pref_matrix <- cbind(c(0.8, 0.1), c(0.1, 0.7))
blocky <- sample_(sbm(n = 20, pref.matrix = pref_matrix,
  block.sizes = c(10, 10)))

blocky2 <- pref_matrix %>%
  sample_sbm(n = 20, block.sizes = c(10, 10))

## Arguments are passed on from sample_ to sample_sbm
blocky3 <- pref_matrix %>%
  sample_(sbm(), n = 20, block.sizes = c(10, 10))



