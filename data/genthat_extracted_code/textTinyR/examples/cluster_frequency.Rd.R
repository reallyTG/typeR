library(textTinyR)


### Name: cluster_frequency
### Title: Frequencies of an existing cluster object
### Aliases: cluster_frequency

### ** Examples


library(textTinyR)

tok_lst = list(c('the', 'the', 'tokens', 'of', 'first', 'document'),
               c('the', 'tokens', 'of', 'of', 'second', 'document'),
               c('the', 'tokens', 'of', 'third', 'third', 'document'))

vec_clust = rep(1:6, 3)

res = cluster_frequency(tok_lst, vec_clust)



