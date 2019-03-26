library(tfio)


### Name: ignite_dataset
### Title: Create a 'IgniteDataset'.
### Aliases: ignite_dataset

### ** Examples

## Not run: 
##D dataset <- ignite_dataset(
##D     cache_name = "SQL_PUBLIC_TEST_CACHE", port = 10800) %>%
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




