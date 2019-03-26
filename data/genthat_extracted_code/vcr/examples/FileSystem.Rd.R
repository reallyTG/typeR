library(vcr)


### Name: FileSystem
### Title: File system persister
### Aliases: FileSystem
### Keywords: internal

### ** Examples

## Not run: 
##D vcr_configure(dir = tempdir())
##D 
##D (yy <- FileSystem$new(file_name = "file4014931b21b.yml"))
##D yy$set_cassette(content = "hello world!")
##D 
##D # is empty?
##D yy$is_empty()
##D 
##D # get cassette
##D yy$get_cassette(file_name = "file4014931b21b.yml")
##D 
##D # clenaup
##D unlink(file.path(tempdir(), "file4014931b21b.yml"))
## End(Not run)



