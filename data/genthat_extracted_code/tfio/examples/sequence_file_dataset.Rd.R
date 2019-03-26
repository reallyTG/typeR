library(tfio)


### Name: sequence_file_dataset
### Title: Create a 'SequenceFileDataset'.
### Aliases: sequence_file_dataset

### ** Examples

## Not run: 
##D dataset <- sequence_file_dataset("testdata/string.seq") %>%
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




