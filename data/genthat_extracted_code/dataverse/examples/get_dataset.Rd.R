library(dataverse)


### Name: get_dataset
### Title: Get dataset
### Aliases: get_dataset dataset_metadata dataset_files

### ** Examples

## Not run: 
##D # download file from: 
##D # https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/ARKOTI
##D monogan <- get_dataverse("monogan")
##D monogan_data <- dataverse_contents(monogan)
##D d1 <- get_dataset(monogan_data[[1]])
##D dataset_files(monogan_data[[1]])
##D f <- get_file(d1$files$datafile$id[3])
## End(Not run)



