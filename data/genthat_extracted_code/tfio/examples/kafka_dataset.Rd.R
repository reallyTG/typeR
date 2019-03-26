library(tfio)


### Name: kafka_dataset
### Title: Creates a 'KafkaDataset'.
### Aliases: kafka_dataset

### ** Examples

## Not run: 
##D dataset <- kafka_dataset(
##D     topics = list("test:0:0:4"), group = "test", eof = TRUE) %>%
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




