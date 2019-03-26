library(tfdatasets)


### Name: next_batch
### Title: Tensor(s) for retreiving the next batch from a dataset
### Aliases: next_batch

### ** Examples

## Not run: 
##D 
##D # iteration with 'infinite' dataset and explicit step counter
##D 
##D library(tfdatasets)
##D dataset <- text_line_dataset("mtcars.csv", record_spec = mtcars_spec) %>%
##D   dataset_prepare(x = c(mpg, disp), y = cyl) %>%
##D   dataset_shuffle(5000) %>%
##D   dataset_batch(128) %>%
##D   dataset_repeat() # repeat infinitely
##D batch <- next_batch(dataset)
##D steps <- 200
##D for (i in 1:steps) {
##D   # use batch$x and batch$y tensors
##D }
##D 
##D # iteration that detects and ignores end of iteration error
##D 
##D library(tfdatasets)
##D dataset <- text_line_dataset("mtcars.csv", record_spec = mtcars_spec) %>%
##D   dataset_prepare(x = c(mpg, disp), y = cyl) %>%
##D   dataset_batch(128) %>%
##D   dataset_repeat(10)
##D batch <- next_batch(dataset)
##D with_dataset({
##D   while(TRUE) {
##D     # use batch$x and batch$y tensors
##D   }
##D })
## End(Not run)




