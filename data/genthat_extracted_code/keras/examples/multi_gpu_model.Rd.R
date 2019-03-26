library(keras)


### Name: multi_gpu_model
### Title: Replicates a model on different GPUs.
### Aliases: multi_gpu_model

### ** Examples

## Not run: 
##D 
##D library(keras)
##D library(tensorflow)
##D 
##D num_samples <- 1000
##D height <- 224
##D width <- 224
##D num_classes <- 1000
##D 
##D # Instantiate the base model (or "template" model).
##D # We recommend doing this with under a CPU device scope,
##D # so that the model's weights are hosted on CPU memory.
##D # Otherwise they may end up hosted on a GPU, which would
##D # complicate weight sharing.
##D with(tf$device("/cpu:0"), {
##D   model <- application_xception(
##D     weights = NULL,
##D     input_shape = c(height, width, 3),
##D     classes = num_classes
##D   )
##D })
##D 
##D # Replicates the model on 8 GPUs.
##D # This assumes that your machine has 8 available GPUs.
##D parallel_model <- multi_gpu_model(model, gpus = 8)
##D parallel_model %>% compile(
##D   loss = "categorical_crossentropy",
##D   optimizer = "rmsprop"
##D )
##D 
##D # Generate dummy data.
##D x <- array(runif(num_samples * height * width*3), 
##D            dim = c(num_samples, height, width, 3))
##D y <- array(runif(num_samples * num_classes), 
##D            dim = c(num_samples, num_classes))
##D 
##D # This `fit` call will be distributed on 8 GPUs.
##D # Since the batch size is 256, each GPU will process 32 samples.
##D parallel_model %>% fit(x, y, epochs = 20, batch_size = 256)
##D 
##D # Save model via the template model (which shares the same weights):
##D model %>% save_model_hdf5("my_model.h5")
## End(Not run)




