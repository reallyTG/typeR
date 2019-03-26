library(reinforcelearn)


### Name: ValueNetwork
### Title: Value Network
### Aliases: ValueNetwork neural.network

### ** Examples

## Not run: 
##D library(keras)
##D model = keras_model_sequential()
##D model %>% layer_dense(20, input_shape = 10, activation = "relu")
##D model %>% layer_dense(4, activation = "softmax")
##D keras::compile(model, loss = "mae", optimizer = keras::optimizer_sgd(lr = 0.4))
##D 
##D val = makeValueFunction("neural.network", model = model)
## End(Not run)



