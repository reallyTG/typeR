library(tfio)


### Name: parquet_dataset
### Title: Create a 'ParquetDataset'.
### Aliases: parquet_dataset

### ** Examples

## Not run: 
##D dtypes <- tf$python$framework$dtypes
##D output_types <- reticulate::tuple(
##D   dtypes$bool, dtypes$int32, dtypes$int64, dtypes$float32, dtypes$float64)
##D dataset <- parquet_dataset(
##D     filenames = list("testdata/parquet_cpp_example.parquet"),
##D     columns = list(0, 1, 2, 4, 5),
##D     output_types = output_types) %>%
##D   dataset_repeat(2)
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




