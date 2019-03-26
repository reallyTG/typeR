library(tfdatasets)


### Name: until_out_of_range
### Title: Execute code that traverses a dataset until an out of range
###   condition occurs
### Aliases: until_out_of_range out_of_range_handler

### ** Examples

## Not run: 
##D library(tfdatasets)
##D dataset <- text_line_dataset("mtcars.csv", record_spec = mtcars_spec) %>%
##D   dataset_batch(128) %>%
##D   dataset_repeat(10) %>%
##D   dataset_prepare(x = c(mpg, disp), y = cyl)
##D 
##D iter <- make_iterator_one_shot(dataset)
##D next_batch <- iterator_get_next(iter)
##D 
##D until_out_of_range({
##D   batch <- sess$run(next_batch)
##D   # use batch$x and batch$y tensors
##D })
## End(Not run)




