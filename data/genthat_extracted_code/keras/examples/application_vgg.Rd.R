library(keras)


### Name: application_vgg
### Title: VGG16 and VGG19 models for Keras.
### Aliases: application_vgg application_vgg16 application_vgg19

### ** Examples

## Not run: 
##D library(keras)
##D 
##D model <- application_vgg16(weights = 'imagenet', include_top = FALSE)
##D 
##D img_path <- "elephant.jpg"
##D img <- image_load(img_path, target_size = c(224,224))
##D x <- image_to_array(img)
##D x <- array_reshape(x, c(1, dim(x)))
##D x <- imagenet_preprocess_input(x)
##D 
##D features <- model %>% predict(x)
## End(Not run)



