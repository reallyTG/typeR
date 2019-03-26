library(tfdatasets)


### Name: dataset_interleave
### Title: Maps map_func across this dataset, and interleaves the results
### Aliases: dataset_interleave

### ** Examples

## Not run: 
##D 
##D dataset <- tensor_slices_dataset(c(1,2,3,4,5)) %>%
##D  dataset_interleave(cycle_length = 2, block_length = 4, function(x) {
##D    tensors_dataset(x) %>%
##D      dataset_repeat(6)
##D  })
##D 
##D # resulting dataset (newlines indicate "block" boundaries):
##D c(1, 1, 1, 1,
##D   2, 2, 2, 2,
##D   1, 1,
##D   2, 2,
##D   3, 3, 3, 3,
##D   4, 4, 4, 4,
##D   3, 3,
##D   4, 4,
##D   5, 5, 5, 5,
##D   5, 5,
##D )
##D 
## End(Not run)




