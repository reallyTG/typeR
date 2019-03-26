library(drake)


### Name: test_with_dir
### Title: Run a unit test in a way that quarantines the side effects from
###   your workspace and file system.
### Aliases: test_with_dir
### Keywords: internal

### ** Examples

## Not run: 
##D test_with_dir(
##D   "Write a file to a temporary folder",
##D   writeLines("hello", "world.txt")
##D )
##D file.exists("world.txt") # FALSE
## End(Not run)



