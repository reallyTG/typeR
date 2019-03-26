library(tigreBrowserWriter)


### Name: initializeDb
### Title: Create and initialize a database
### Aliases: initializeDb

### ** Examples

## Not run: 
##D   # Create a real database to a file
##D   db <- initializeDb("/path/to/the/database.sqlite", "My Dataset")
##D   closeDb(db)
## End(Not run)

  # Create a temporary database to be deleted at the end
  db <- initializeDb("", "My Dataset")
  closeDb(db)



