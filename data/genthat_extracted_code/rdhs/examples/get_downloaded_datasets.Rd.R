library(rdhs)


### Name: get_downloaded_datasets
### Title: Get Downloaded Datasets
### Aliases: get_downloaded_datasets

### ** Examples

## Not run: 
##D # get the model datasets included with the package
##D model_datasets <- model_datasets
##D 
##D # download one of them
##D g <- get_datasets(dataset_filenames = model_datasets$FileName[1])
##D 
##D # these will then be stored so that we know what datasets we have downloaded
##D d <- get_downloaded_datasets()
##D 
##D # which returns a names list of file paths to the datasets
##D d[1]
## End(Not run)



