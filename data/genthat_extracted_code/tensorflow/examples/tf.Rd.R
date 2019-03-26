library(tensorflow)


### Name: tf
### Title: Main TensorFlow module
### Aliases: tf
### Keywords: datasets

### ** Examples

## Not run: 
##D library(tensorflow)
##D 
##D hello <- tf$constant('Hello, TensorFlow!')
##D zeros <- tf$Variable(tf$zeros(shape(1L)))
##D 
##D sess <- tf$Session()
##D sess$run(tf$global_variables_initializer())
##D 
##D sess$run(hello)
##D sess$run(zeros)
## End(Not run)



