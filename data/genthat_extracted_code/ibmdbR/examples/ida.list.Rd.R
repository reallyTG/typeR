library(ibmdbR)


### Name: ida.list
### Title: Store and retrieve R objects in the database
### Aliases: ida.list is.ida.list

### ** Examples

## Not run: 
##D # Create a pointer to the private R object storage table of the current user.
##D myPrivateObjects <- ida.list(type='private')
##D 
##D # Use the pointer created in the previous example to store a series of numbers in an object with 
##D # the name 'series100' in the private R object storage table of the current user.
##D myPrivateObjects['series100'] <- 1:100
##D 
##D # Retrieve the object with the name 'series100' from the 
##D # private R object storage table of the current user.
##D x <- myPrivateObjects['series100']
##D 
##D # Delete the object with name 'series100' from the 
##D # private R object storage table of the current user.
##D 
##D myPrivateObjects['series100'] <- NULL
##D 
##D # List all objects in the private R object storage table of the current user.
##D names(myPrivateObjects)
##D 
##D # Return the number of objects in the private R object storage table of the current user.
##D length(myPrivateObjects)
##D 
##D # Create a pointer to the public R object storage table of the current user.
##D myPublicObjects <- ida.list(type="public")
##D 
## End(Not run)



