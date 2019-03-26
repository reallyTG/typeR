library(remoter)


### Name: s2c
### Title: Server-to-Client Object Transfer
### Aliases: s2c

### ** Examples

## Not run: 
##D ### Prompts are listed to clarify when something is eval'd locally vs remotely
##D > library(remoter)
##D > y
##D ###  Error: object 'y' not found
##D > remoter::connect("my.remote.server")
##D remoter> x
##D ### Error: object 'x' not found
##D remoter> x <- "some data"
##D remoter> x
##D ###  [1] "some data" 
##D remoter> s2c(x, "y")
##D remoter> q()
##D > y
##D ###  [1] "some data"
## End(Not run)




