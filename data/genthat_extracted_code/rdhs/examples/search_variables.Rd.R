library(rdhs)


### Name: search_variables
### Title: Search Survey Variables
### Aliases: search_variables

### ** Examples

## Not run: 
##D # get the model datasets included with the package
##D model_datasets <- model_datasets
##D 
##D # download two of them
##D g <- get_datasets(dataset_filenames = model_datasets$FileName[1:2])
##D 
##D # and now seearch within these for survey variables
##D search_variables(
##D dataset_filenames = names(g), variables = c("v002","v102","ml13"),
##D )
##D 
##D # if we specify an essential variable then that dataset has to have that
##D # variable or else no variables will be returned for that datasets
##D search_variables(
##D dataset_filenames = names(g),
##D variables = c("v002","v102","ml13"),
##D essential_variables = "ml13"
##D )
## End(Not run)



