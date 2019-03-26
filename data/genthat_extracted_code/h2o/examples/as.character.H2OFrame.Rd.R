library(h2o)


### Name: as.character.H2OFrame
### Title: Convert an H2OFrame to a String
### Aliases: as.character.H2OFrame

### ** Examples

## No test: 
h2o.init()
pretrained <- as.h2o(data.frame(
       C1 = c("a", "b"), C2 = c(0, 1), C3 = c(1, 0), C4 = c(0.2, 0.8),
       stringsAsFactors = FALSE))
pretrained_w2v <- h2o.word2vec(pre_trained = pretrained, vec_size = 3)
words <- as.character(as.h2o(c("b", "a", "c", NA, "a")))
vecs <- h2o.transform(pretrained_w2v, words = words)
## End(No test)



