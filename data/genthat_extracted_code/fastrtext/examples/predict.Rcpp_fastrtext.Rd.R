library(fastrtext)


### Name: predict.Rcpp_fastrtext
### Title: Get predictions (for supervised model)
### Aliases: predict.Rcpp_fastrtext

### ** Examples


library(fastrtext)
data("test_sentences")
model_test_path <- system.file("extdata", "model_classification_test.bin", package = "fastrtext")
model <- load_model(model_test_path)
sentence <- test_sentences[1, "text"]
print(predict(model, sentence))




