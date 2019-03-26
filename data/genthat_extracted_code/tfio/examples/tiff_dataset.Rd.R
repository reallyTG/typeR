library(tfio)


### Name: tiff_dataset
### Title: Create a 'TIFFDataset'.
### Aliases: tiff_dataset

### ** Examples

## Not run: 
##D dataset <- tiff_dataset(
##D     filenames = list("testdata/small.tiff")) %>%
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




