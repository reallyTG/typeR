library(fastrtext)


### Name: get_parameters
### Title: Export hyper parameters
### Aliases: get_parameters

### ** Examples


library(fastrtext)
model_test_path <- system.file("extdata", "model_classification_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
print(head(get_parameters(model), 5))




