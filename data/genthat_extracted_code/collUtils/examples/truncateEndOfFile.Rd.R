library(collUtils)


### Name: truncateEndOfFile
### Title: Truncate n bytes from end of file
### Aliases: truncateEndOfFile

### ** Examples

## Not run: 
##D fn = tempfile()
##D f = file(fn, "wb")
##D writeBin("a", f)
##D writeBin("b", f)
##D writeBin("c", f)
##D close(f)
##D file.info(fn)$size == 6
##D truncateEndOfFile(fn, 1)
##D file.info(fn)$size == 5
## End(Not run)



