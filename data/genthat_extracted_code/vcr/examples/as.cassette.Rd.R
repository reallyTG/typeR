library(vcr)


### Name: as.cassette
### Title: Coerce names, etc. to cassettes
### Aliases: as.cassette as.cassettepath

### ** Examples

## Not run: 
##D vcr_configure(dir = tempfile())
##D insert_cassette("foobar")
##D cassettes(on_disk = FALSE)
##D cassettes(on_disk = TRUE)
##D as.cassette("foobar", on_disk = FALSE)
##D eject_cassette() # eject the current cassette
##D 
##D # cleanup
##D unlink(file.path(tempfile(), "foobar.yml"))
## End(Not run)



