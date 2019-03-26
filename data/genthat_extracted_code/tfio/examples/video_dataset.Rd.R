library(tfio)


### Name: video_dataset
### Title: Create a 'VideoDataset' that reads the video file.
### Aliases: video_dataset

### ** Examples

## Not run: 
##D dataset <- video_dataset(
##D     filenames = list("testdata/small.mp4")) %>%
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




