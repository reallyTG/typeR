library(tfdatasets)


### Name: with_dataset
### Title: Execute code that traverses a dataset
### Aliases: with_dataset

### ** Examples

## Not run: 
##D library(tfdatasets)
##D dataset <- text_line_dataset("mtcars.csv", record_spec = mtcars_spec) %>%
##D   dataset_prepare(x = c(mpg, disp), y = cyl) %>%
##D   dataset_batch(128) %>%
##D   dataset_repeat(10)
##D 
##D iter <- make_iterator_one_shot(dataset)
##D next_batch <- iterator_get_next(iter)
##D 
##D with_dataset({
##D   while(TRUE) {
##D     batch <- sess$run(next_batch)
##D     # use batch$x and batch$y tensors
##D   }
##D })
## End(Not run)




