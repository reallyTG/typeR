library(fastrtext)


### Name: get_analogies
### Title: Get analogy
### Aliases: get_analogies

### ** Examples


library(fastrtext)
model_test_path <- system.file("extdata", "model_unsupervised_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
get_analogies(model, "experience", "experiences", "result")




