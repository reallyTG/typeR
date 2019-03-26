library(rdhs)


### Name: read_zipdata
### Title: Read filetype from a zipped folder based on the file ending
### Aliases: read_zipdata

### ** Examples

## Not run: 
##D # get the model datasets included in the package
##D model_datasets <- model_datasets
##D 
##D # download just the zip
##D g <- get_datasets(
##D dataset_filenames = model_datasets$FileName[1],
##D download_option = "zip"
##D )
##D 
##D # and then read from the zip. This function is used internally by rdhs
##D # when using `get_datasets` with `download_option = .rds` (default)
##D r <- read_zipdata(
##D g[[1]], pattern = ".dta"
##D )
##D 
##D # and we can pass a function to read the file and any other args with ...
##D r <- read_zipdata(
##D g[[1]], pattern = ".dta", readfn = haven::read_dta, encoding = "UTF-8"
##D )
## End(Not run)



