library(fastrtext)


### Name: get_labels
### Title: Get list of labels (supervised model)
### Aliases: get_labels

### ** Examples


library(fastrtext)
model_test_path <- system.file("extdata", "model_classification_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
print(head(get_labels(model), 5))




