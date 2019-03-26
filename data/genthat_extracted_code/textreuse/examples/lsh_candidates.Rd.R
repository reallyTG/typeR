library(textreuse)


### Name: lsh_candidates
### Title: Candidate pairs from LSH comparisons
### Aliases: lsh_candidates

### ** Examples

dir <- system.file("extdata/legal", package = "textreuse")
minhash <- minhash_generator(200, seed = 234)
corpus <- TextReuseCorpus(dir = dir,
                          tokenizer = tokenize_ngrams, n = 5,
                          minhash_func = minhash)
buckets <- lsh(corpus, bands = 50)
lsh_candidates(buckets)




