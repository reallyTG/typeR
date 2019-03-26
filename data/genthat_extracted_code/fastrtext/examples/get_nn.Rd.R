library(fastrtext)


### Name: get_nn
### Title: Get nearest neighbour vectors
### Aliases: get_nn

### ** Examples


library(fastrtext)
model_test_path <- system.file("extdata", "model_unsupervised_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
get_nn(model, "time", 10)




