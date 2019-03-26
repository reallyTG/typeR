library(searcher)


### Name: searcher
### Title: Generate a Searcher function for use with Error Handling
### Aliases: searcher

### ** Examples

### Manually
searcher("google")()

## Not run: 
##D ### Automatically
##D # On error, automatically search the message on google
##D options(error = searcher("google"))
## End(Not run)



