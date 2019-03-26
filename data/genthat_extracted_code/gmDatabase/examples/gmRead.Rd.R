library(gmDatabase)


### Name: gmRead
### Title: Return the result of an SQl query given as R-like representation
### Aliases: gmRead gmReadInternal
### Keywords: databases

### ** Examples

## Not run: 
##D .gmDB <- dbConnect(...)
##D root <- "root"
##D erg <- gmRead(root)
##D ## returns the ID of root in the database
##D 
##D gmRead(root$project[gmTitle=group])
##D ## groups
## End(Not run)



