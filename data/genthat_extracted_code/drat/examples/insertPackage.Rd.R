library(drat)


### Name: insertPackage
### Title: Insert a package source or binary file into a drat repository
### Aliases: insertPackage drat:::insert insert

### ** Examples

## Not run: 
##D   insertPackage("foo_0.2.3.tar.gz")   # inserts into (default) repo
##D   insertPackage("foo_0.2.3.tar.gz", "/nas/R/")  # ... into local dir
## End(Not run)
## Not run: 
##D   insertPackage("foo_0.2.3.tar.gz", action = "prune")   # prunes any older copies
##D   insertPackage("foo_0.2.3.tar.gz", action = "archive")   # archives any older copies
## End(Not run)



