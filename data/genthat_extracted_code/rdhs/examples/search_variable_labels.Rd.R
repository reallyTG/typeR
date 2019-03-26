library(rdhs)


### Name: search_variable_labels
### Title: Search Survey Variable Definitions
### Aliases: search_variable_labels

### ** Examples

## Not run: 
##D # get the model datasets included with the package
##D model_datasets <- model_datasets
##D 
##D # download two of them
##D g <- get_datasets(dataset_filenames = model_datasets$FileName[1:2])
##D 
##D # and now seearch within these for survey variable labels of interest
##D vars <- search_variable_labels(
##D dataset_filenames = names(g), search_terms = "fever"
##D )
##D 
##D head(vars)
##D 
##D # if we specify an essential term then no results will be returned from
##D # a dataset if it does not have any results from the search with this term
##D search_variable_labels(
##D dataset_filenames = names(g),
##D search_terms = "fever",
##D essential_terms = "primaquine",
##D )
##D 
##D # we can also use regex queries if we prefer, by passing `regex = TRUE`
##D vars <- search_variable_labels(
##D dataset_filenames = names(g), search_terms = "fever|net", regex = TRUE
##D )
## End(Not run)



