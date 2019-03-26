library(sets)


### Name: similarity
### Title: Similarity and Dissimilarity Functions
### Aliases: set_similarity gset_similarity cset_similarity
###   set_dissimilarity gset_dissimilarity cset_dissimilarity
### Keywords: math

### ** Examples

A <- set("a", "b", "c")
B <- set("c", "d", "e")
set_similarity(A, B)
set_dissimilarity(A, B)

A <- gset(c("a", "b", "c"), c(0.3, 0.7, 0.9))
B <- gset(c("c", "d", "e"), c(0.2, 0.4, 0.5))
gset_similarity(A, B, "Jaccard")
gset_dissimilarity(A, B, "Jaccard")
gset_dissimilarity(A, B, "L1")
gset_dissimilarity(A, B, "L2")

A <- gset(c("a", "b", "c"), list(c(0.3, 0.7), 0.1, 0.9))
B <- gset(c("c", "d", "e"), list(0.2, c(0.4, 0.5), 0.8))
gset_similarity(A, B, "Jaccard")
gset_dissimilarity(A, B, "Jaccard")
gset_dissimilarity(A, B, "L1")
gset_dissimilarity(A, B, "L2")



