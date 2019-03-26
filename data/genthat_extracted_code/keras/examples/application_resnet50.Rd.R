library(keras)


### Name: application_resnet50
### Title: ResNet50 model for Keras.
### Aliases: application_resnet50

### ** Examples

## Not run: 
##D library(keras)
##D 
##D # instantiate the model
##D model <- application_resnet50(weights = 'imagenet')
##D 
##D # load the image
##D img_path <- "elephant.jpg"
##D img <- image_load(img_path, target_size = c(224,224))
##D x <- image_to_array(img)
##D 
##D # ensure we have a 4d tensor with single element in the batch dimension,
##D # the preprocess the input for prediction using resnet50
##D x <- array_reshape(x, c(1, dim(x)))
##D x <- imagenet_preprocess_input(x)
##D 
##D # make predictions then decode and print them
##D preds <- model %>% predict(x)
##D imagenet_decode_predictions(preds, top = 3)[[1]]
## End(Not run)   



