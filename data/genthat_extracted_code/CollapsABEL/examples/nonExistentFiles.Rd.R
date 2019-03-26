library(CollapsABEL)


### Name: nonExistentFiles
### Title: Non-existent files from a vector of filenames
### Aliases: nonExistentFiles

### ** Examples

## Not run: 
##D nonExistentFiles(R.home())
##D nonExistentFiles(sapply(1:5, function(i) tempfile()))
##D nonExistentFiles(sapply(1:5, function(i) tempdir()))
##D nonExistentFiles(c("/tmp/f3412lds43289ajkfdlsa", R.home())) == "/tmp/f3412lds43289ajkfdlsa"
## End(Not run)




