library(rdhs)


### Name: extract_dhs
### Title: Extract Data
### Aliases: extract_dhs

### ** Examples

## Not run: 
##D # get the model datasets included with the package
##D model_datasets <- model_datasets
##D 
##D # download one of them
##D g <- get_datasets(dataset_filenames = model_datasets$FileName[1])
##D 
##D # create some terms of data me may want to extrac
##D st <- search_variable_labels(names(g), "bed net")
##D 
##D # and now extract it
##D ex <- extract_dhs(st)
## End(Not run)



