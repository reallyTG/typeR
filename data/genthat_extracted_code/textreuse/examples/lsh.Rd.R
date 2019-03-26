library(textreuse)


### Name: lsh
### Title: Locality sensitive hashing for minhash
### Aliases: lsh

### ** Examples

dir <- system.file("extdata/legal", package = "textreuse")
minhash <- minhash_generator(200, seed = 235)
corpus <- TextReuseCorpus(dir = dir,
                          tokenizer = tokenize_ngrams, n = 5,
                          minhash_func = minhash)
buckets <- lsh(corpus, bands = 50)
buckets



