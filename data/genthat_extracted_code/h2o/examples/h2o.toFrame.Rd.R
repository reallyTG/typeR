library(h2o)


### Name: h2o.toFrame
### Title: Convert a word2vec model into an H2OFrame
### Aliases: h2o.toFrame

### ** Examples

## No test: 
h2o.init()

# Build a dummy word2vec model
data <- as.character(as.h2o(c("a", "b", "a")))
w2v_model <- h2o.word2vec(data, sent_sample_rate = 0, min_word_freq = 0, epochs = 1, vec_size = 2)

# Transform words to vectors and return average vector for each sentence
h2o.toFrame(w2v_model) # -> Frame made of 2 rows and 2 columns
## End(No test)



