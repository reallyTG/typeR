library(keras)


### Name: keras_model_sequential
### Title: Keras Model composed of a linear stack of layers
### Aliases: keras_model_sequential

### ** Examples

## Not run: 
##D  
##D library(keras)
##D 
##D model <- keras_model_sequential() 
##D model %>% 
##D   layer_dense(units = 32, input_shape = c(784)) %>% 
##D   layer_activation('relu') %>% 
##D   layer_dense(units = 10) %>% 
##D   layer_activation('softmax')
##D 
##D model %>% compile(
##D   optimizer = 'rmsprop',
##D   loss = 'categorical_crossentropy',
##D   metrics = c('accuracy')
##D )
## End(Not run)



