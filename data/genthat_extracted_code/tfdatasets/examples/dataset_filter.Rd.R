library(tfdatasets)


### Name: dataset_filter
### Title: Filter a dataset by a predicate
### Aliases: dataset_filter

### ** Examples

## Not run: 
##D 
##D dataset <- text_line_dataset("mtcars.csv", record_spec = mtcars_spec) %>%
##D   dataset_filter(function(record) {
##D     record$mpg >= 20
##D })
##D 
##D dataset <- text_line_dataset("mtcars.csv", record_spec = mtcars_spec) %>%
##D   dataset_filter(function(record) {
##D     record$mpg >= 20 & record$cyl >= 6L
##D   })
##D 
## End(Not run)




