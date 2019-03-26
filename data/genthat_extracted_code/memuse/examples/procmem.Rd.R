library(memuse)


### Name: procmem
### Title: procmem
### Aliases: procmem Sys.procmem

### ** Examples

## Not run: 
##D library(memuse)
##D 
##D ### How much is being used?
##D Sys.procmem()
##D 
##D ### Use more.
##D x <- rnorm(1e7)
##D Sys.procmem()
##D 
##D ### Use less.
##D rm(x)
##D gc(FALSE)
##D Sys.procmem()
## End(Not run)




