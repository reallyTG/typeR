library(textreuse)


### Name: pairwise_compare
### Title: Pairwise comparisons among documents in a corpus
### Aliases: pairwise_compare

### ** Examples

dir <- system.file("extdata/legal", package = "textreuse")
corpus <- TextReuseCorpus(dir = dir)
names(corpus) <- filenames(names(corpus))

# A non-directional comparison
pairwise_compare(corpus, jaccard_similarity)

# A directional comparison
pairwise_compare(corpus, ratio_of_matches, directional = TRUE)



