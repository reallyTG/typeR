library(fastrtext)


### Name: get_hamming_loss
### Title: Hamming loss
### Aliases: get_hamming_loss

### ** Examples


library(fastrtext)
data("test_sentences")
model_test_path <- system.file("extdata", "model_classification_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
sentences <- test_sentences[, "text"]
test_labels <- test_sentences[, "class.text"]
predictions <- predict(model, sentences)
get_hamming_loss(as.list(test_labels), predictions)




