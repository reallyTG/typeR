library(fastrtext)


### Name: get_sentence_representation
### Title: Get sentence embedding
### Aliases: get_sentence_representation

### ** Examples

library(fastrtext)
model_test_path <- system.file("extdata", "model_unsupervised_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
m <- get_sentence_representation(model, "this is a test")
print(m)



