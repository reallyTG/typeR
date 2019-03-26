library(lime)


### Name: lime
### Title: Create a model explanation function based on training data
### Aliases: lime lime.character lime.data.frame lime.imagefile

### ** Examples

# Explaining a model based on text data

# Purpose is to classify sentences from scientific publications
# and find those where the team writes about their own work
# (category OWNX in the provided dataset).

library(text2vec)
library(xgboost)

data(train_sentences)
data(test_sentences)

get_matrix <- function(text) {
  it <- itoken(text, progressbar = FALSE)
  create_dtm(it, vectorizer = hash_vectorizer())
}

dtm_train = get_matrix(train_sentences$text)

xgb_model <- xgb.train(list(max_depth = 7, eta = 0.1, objective = "binary:logistic",
                 eval_metric = "error", nthread = 1),
                 xgb.DMatrix(dtm_train, label = train_sentences$class.text == "OWNX"),
                 nrounds = 50)

sentences <- head(test_sentences[test_sentences$class.text == "OWNX", "text"], 1)
explainer <- lime(train_sentences$text, xgb_model, get_matrix)
explanations <- explain(sentences, explainer, n_labels = 1, n_features = 2)

# We can see that many explanations are based
# on the presence of the word `we` in the sentences
# which makes sense regarding the task.
print(explanations)

# Explaining a model based on tabular data
library(MASS)
iris_test <- iris[1, 1:4]
iris_train <- iris[-1, 1:4]
iris_lab <- iris[[5]][-1]
# Create linear discriminant model on iris data
model <- lda(iris_train, iris_lab)
# Create explanation object
explanation <- lime(iris_train, model)

# This can now be used together with the explain method
explain(iris_test, explanation, n_labels = 1, n_features = 2)

## Not run: 
##D library(keras)
##D library(abind)
##D # get some image
##D img_path <- system.file('extdata', 'produce.png', package = 'lime')
##D # load a predefined image classifier
##D model <- application_vgg16(
##D   weights = "imagenet",
##D   include_top = TRUE
##D )
##D 
##D # create a function that prepare images for the model
##D img_preprocess <- function(x) {
##D   arrays <- lapply(x, function(path) {
##D     img <- image_load(path, target_size = c(224,224))
##D     x <- image_to_array(img)
##D     x <- array_reshape(x, c(1, dim(x)))
##D     x <- imagenet_preprocess_input(x)
##D   })
##D   do.call(abind, c(arrays, list(along = 1)))
##D }
##D 
##D # Create an explainer (lime recognise the path as an image)
##D explainer <- lime(img_path, as_classifier(model, unlist(labels)), img_preprocess)
##D 
##D # Explain the model (can take a long time depending on your system)
##D explanation <- explain(img_path, explainer, n_labels = 2, n_features = 10, n_superpixels = 70)
## End(Not run)



