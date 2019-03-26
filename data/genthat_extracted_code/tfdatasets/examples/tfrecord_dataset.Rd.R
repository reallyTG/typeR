library(tfdatasets)


### Name: tfrecord_dataset
### Title: A dataset comprising records from one or more TFRecord files.
### Aliases: tfrecord_dataset

### ** Examples

## Not run: 
##D 
##D # Creates a dataset that reads all of the examples from two files, and extracts
##D # the image and label features.
##D filenames <- c("/var/data/file1.tfrecord", "/var/data/file2.tfrecord")
##D dataset <- tfrecord_dataset(filenames) %>%
##D   dataset_map(function(example_proto) {
##D     features <- list(
##D       image = tf$FixedLenFeature(shape(), tf$string, default_value = ""),
##D       label = tf$FixedLenFeature(shape(), tf$int32, default_value = 0L)
##D     )
##D     tf$parse_single_example(example_proto, features)
##D   })
## End(Not run)




