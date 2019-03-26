library(ruimtehol)


### Name: embedding_similarity
### Title: Cosine and Inner product based similarity
### Aliases: embedding_similarity

### ** Examples

x <- matrix(rnorm(6), nrow = 2, ncol = 3)
rownames(x) <- c("word1", "word2")
y <- matrix(rnorm(15), nrow = 5, ncol = 3)
rownames(y) <- c("term1", "term2", "term3", "term4", "term5")

embedding_similarity(x, y, type = "cosine")
embedding_similarity(x, y, type = "dot")
embedding_similarity(x, y, type = "cosine", top_n = 1)
embedding_similarity(x, y, type = "dot", top_n = 1)
embedding_similarity(x, y, type = "cosine", top_n = 2)
embedding_similarity(x, y, type = "dot", top_n = 2)
embedding_similarity(x, y, type = "cosine", top_n = +Inf)
embedding_similarity(x, y, type = "dot", top_n = +Inf)



