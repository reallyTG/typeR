library(dataverse)


### Name: delete_sword_dataset
### Title: Delete dataset (SWORD)
### Aliases: delete_sword_dataset

### ** Examples

## Not run: 
##D # retrieve your service document
##D d <- service_document()
##D 
##D # create a list of metadata
##D metadat <- list(title = "My Study",
##D                 creator = "Doe, John",
##D                 description = "An example study")
##D 
##D # create the dataset in first dataverse
##D dat <- initiate_sword_dataset(d[[2]], body = metadat)
##D 
##D # delete a dataset
##D delete_dataset(dat)
## End(Not run)



