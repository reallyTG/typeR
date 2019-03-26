library(udpipe)


### Name: as_word2vec
### Title: Convert a matrix of word vectors to word2vec format
### Aliases: as_word2vec

### ** Examples

wordvectors <- matrix(rnorm(1000), nrow = 100, ncol = 10)
rownames(wordvectors) <- sprintf("word%s", seq_len(nrow(wordvectors)))
wv <- as_word2vec(wordvectors)
cat(wv)

f <- file(tempfile(fileext = ".txt"), encoding = "UTF-8")
cat(wv, file = f)
close(f)



