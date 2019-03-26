library(tfio)


### Name: webp_dataset
### Title: Create a 'WebPDataset'.
### Aliases: webp_dataset

### ** Examples

## Not run: 
##D dataset <- webp_dataset(
##D     filenames = list("testdata/sample.webp")) %>%
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




