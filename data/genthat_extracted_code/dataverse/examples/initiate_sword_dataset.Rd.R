library(dataverse)


### Name: initiate_sword_dataset
### Title: Initiate dataset (SWORD)
### Aliases: initiate_sword_dataset

### ** Examples

## Not run: 
##D # retrieve your service document (dataverse list)
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
##D # add files to dataset
##D tmp <- tempfile(fileext = ".csv")
##D write.csv(iris, file = tmp)
##D add_file(dat, file = tmp)
##D 
##D # publish dataset
##D publish_dataset(dat)
## End(Not run)



