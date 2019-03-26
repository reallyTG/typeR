library(textreuse)


### Name: lsh_subset
### Title: List of all candidates in a corpus
### Aliases: lsh_subset

### ** Examples

dir <- system.file("extdata/legal", package = "textreuse")
minhash <- minhash_generator(200, seed = 234)
corpus <- TextReuseCorpus(dir = dir,
                          tokenizer = tokenize_ngrams, n = 5,
                          minhash_func = minhash)
buckets <- lsh(corpus, bands = 50)
candidates <- lsh_candidates(buckets)
lsh_subset(candidates)
corpus[lsh_subset(candidates)]



