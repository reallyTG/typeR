library(tfio)


### Name: arrow_stream_dataset
### Title: Creates a 'ArrowStreamDataset'.
### Aliases: arrow_stream_dataset

### ** Examples

## Not run: 
##D dataset <- arrow_stream_dataset(
##D     host,
##D     columns = reticulate::tuple(0L, 1L),
##D     output_types = reticulate::tuple(tf$int32, tf$float32),
##D     output_shapes = reticulate::tuple(list(), list())) %>%
##D   dataset_repeat(1)
##D 
##D sess <- tf$Session()
##D iterator <- make_iterator_one_shot(dataset)
##D next_batch <- iterator_get_next(iterator)
##D 
##D until_out_of_range({
##D   batch <- sess$run(next_batch)
##D   print(batch)
##D })
## End(Not run)




