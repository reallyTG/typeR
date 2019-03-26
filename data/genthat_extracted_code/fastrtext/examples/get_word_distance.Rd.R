library(fastrtext)


### Name: get_word_distance
### Title: Distance between two words
### Aliases: get_word_distance

### ** Examples


library(fastrtext)
model_test_path <- system.file("extdata", "model_unsupervised_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
get_word_distance(model, "time", "timing")




