library(rdhs)


### Name: get_variable_labels
### Title: Get Survey Variable Labels
### Aliases: get_variable_labels

### ** Examples

## Not run: 
##D # get the model datasets included with the package
##D model_datasets <- model_datasets
##D 
##D # download one of them
##D g <- get_datasets(dataset_filenames = model_datasets$FileName[1])
##D 
##D # we can pass the list of filepaths to the function
##D head(get_variable_labels(g))
##D 
##D # or we can pass the full dataset
##D r <- readRDS(g[[1]])
##D head(get_variable_labels(r))
## End(Not run)



