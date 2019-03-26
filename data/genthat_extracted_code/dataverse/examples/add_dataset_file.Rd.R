library(dataverse)


### Name: add_dataset_file
### Title: Add or update a file in a dataset
### Aliases: add_dataset_file update_dataset_file

### ** Examples

## Not run: 
##D meta <- list()
##D ds <- create_dataset("mydataverse", body = meta)
##D 
##D saveRDS(mtcars, tmp <- tempfile(fileext = ".rds"))
##D f <- add_dataset_file(tmp, dataset = ds, description = "mtcars")
##D 
##D # publish dataset
##D publish_dataset(ds)
##D 
##D # update file and republish
##D saveRDS(iris, tmp)
##D update_dataset_file(tmp, dataset = ds, id = f, 
##D                     description = "Actually iris")
##D publish_dataset(ds)
##D 
##D # cleanup
##D unlink(tmp)
##D delete_dataset(ds)
## End(Not run)



