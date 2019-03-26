library(rpg)


### Name: stow
### Title: Object storage
### Aliases: stow list_stowed retrieve delete_stowed stow_image
###   retrieve_image

### ** Examples

## Not run: 
##D createdb("rpgtesting")
##D connect("rpgtesting")
##D begin()
##D 
##D stow("test")
##D list_stowed()
##D stow("test")
##D list_stowed()
##D stow(x = "test")
##D list_stowed()
##D x = 1
##D stow(x)
##D list_stowed()
##D stow(y = x)
##D list_stowed()
##D rm(x)
##D retrieve(".*")
##D print(test)
##D print(x)
##D print(y)
##D delete_stowed(".*")
##D data(mtcars)
##D stow(mtcars)
##D list_stowed()
##D rm(mtcars)
##D retrieve("mtcars")
##D head(mtcars)
##D 
##D rollback()
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run)




