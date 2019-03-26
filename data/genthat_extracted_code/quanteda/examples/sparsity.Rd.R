library(quanteda)


### Name: sparsity
### Title: Compute the sparsity of a document-feature matrix
### Aliases: sparsity

### ** Examples

inaug_dfm <- dfm(data_corpus_inaugural, verbose = FALSE)
sparsity(inaug_dfm)
sparsity(dfm_trim(inaug_dfm, min_termfreq = 5))



