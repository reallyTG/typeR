library(fastrtext)


### Name: get_dictionary
### Title: Get list of known words
### Aliases: get_dictionary

### ** Examples


library(fastrtext)
model_test_path <- system.file("extdata", "model_classification_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
print(head(get_dictionary(model), 5))




