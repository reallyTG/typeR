library(textreuse)


### Name: pairwise_candidates
### Title: Candidate pairs from pairwise comparisons
### Aliases: pairwise_candidates

### ** Examples

dir <- system.file("extdata/legal", package = "textreuse")
corpus <- TextReuseCorpus(dir = dir)

m1 <- pairwise_compare(corpus, ratio_of_matches, directional = TRUE)
pairwise_candidates(m1, directional = TRUE)

m2 <- pairwise_compare(corpus, jaccard_similarity)
pairwise_candidates(m2)



