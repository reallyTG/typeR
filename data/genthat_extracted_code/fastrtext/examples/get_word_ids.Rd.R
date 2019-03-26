library(fastrtext)


### Name: get_word_ids
### Title: Retrieve word IDs
### Aliases: get_word_ids

### ** Examples

library(fastrtext)
model_test_path <- system.file("extdata", "model_unsupervised_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
ids <- get_word_ids(model, c("this", "is", "a", "test"))

# print positions
print(ids)
# retrieve words in the dictionary using the positions retrieved
print(get_dictionary(model)[ids])



