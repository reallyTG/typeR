library(projector)


### Name: get_annoy_model
### Title: Build Annoy model
### Aliases: get_annoy_model

### ** Examples

if (interactive()){
# This example should be run with a higher quality model
# than the one embedded in fastrtext
library(projector)
library(fastrtext)

model_test_path <- system.file("extdata",
                               "model_unsupervised_test.bin",
                               package = "fastrtext")
model <- load_model(model_test_path)
word_embeddings <- get_word_vectors(model,
                                    words = head(get_dictionary(model), 2e5))

annoy_model <- get_annoy_model(word_embeddings, 5)
}



