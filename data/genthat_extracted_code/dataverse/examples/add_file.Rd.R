library(dataverse)


### Name: add_file
### Title: Add file (SWORD)
### Aliases: add_file

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
##D # create the dataset
##D dat <- initiate_sword_dataset("mydataverse", body = metadat)
##D 
##D # add files to dataset
##D tmp <- tempfile()
##D write.csv(iris, file = tmp)
##D f <- add_file(dat, file = tmp)
##D 
##D # publish dataset
##D publish_dataset(dat)
##D 
##D # delete a dataset
##D delete_dataset(dat)
## End(Not run)



