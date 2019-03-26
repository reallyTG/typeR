library(keras)


### Name: freeze_weights
### Title: Freeze and unfreeze weights
### Aliases: freeze_weights unfreeze_weights

### ** Examples

## Not run: 
##D # instantiate a VGG16 model
##D conv_base <- application_vgg16(
##D   weights = "imagenet",
##D   include_top = FALSE,
##D   input_shape = c(150, 150, 3)
##D )
##D 
##D # freeze it's weights
##D freeze_weights(conv_base)
##D 
##D # create a composite model that includes the base + more layers
##D model <- keras_model_sequential() %>%
##D   conv_base %>%
##D   layer_flatten() %>%
##D   layer_dense(units = 256, activation = "relu") %>%
##D   layer_dense(units = 1, activation = "sigmoid")
##D 
##D # compile
##D model %>% compile(
##D   loss = "binary_crossentropy",
##D   optimizer = optimizer_rmsprop(lr = 2e-5),
##D   metrics = c("accuracy")
##D )
##D 
##D # unfreeze weights from "block5_conv1" on
##D unfreeze_weights(conv_base, from = "block5_conv1")
##D 
##D # compile again since we froze or unfroze weights
##D model %>% compile(
##D   loss = "binary_crossentropy",
##D   optimizer = optimizer_rmsprop(lr = 2e-5),
##D   metrics = c("accuracy")
##D )
##D 
## End(Not run)




