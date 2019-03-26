library(fastrtext)


### Name: get_word_vectors
### Title: Get word embeddings
### Aliases: get_word_vectors

### ** Examples


library(fastrtext)
model_test_path <- system.file("extdata", "model_unsupervised_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
get_word_vectors(model, c("introduction", "we"))




