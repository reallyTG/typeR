library(keras)


### Name: keras_model
### Title: Keras Model
### Aliases: keras_model

### ** Examples

## Not run: 
##D library(keras)
##D 
##D # input layer
##D inputs <- layer_input(shape = c(784))
##D 
##D # outputs compose input + dense layers
##D predictions <- inputs %>%
##D   layer_dense(units = 64, activation = 'relu') %>% 
##D   layer_dense(units = 64, activation = 'relu') %>% 
##D   layer_dense(units = 10, activation = 'softmax')
##D 
##D # create and compile model
##D model <- keras_model(inputs = inputs, outputs = predictions)
##D model %>% compile(
##D   optimizer = 'rmsprop',
##D   loss = 'categorical_crossentropy',
##D   metrics = c('accuracy')
##D )
## End(Not run)



