library(fastrtext)


### Name: get_tokenized_text
### Title: Tokenize text
### Aliases: get_tokenized_text

### ** Examples

library(fastrtext)
model_test_path <- system.file("extdata", "model_unsupervised_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
tokens <- get_tokenized_text(model, "this is a test")
print(tokens)
tokens <- get_tokenized_text(model, c("this is a test 1", "this is a second test!"))
print(tokens)



