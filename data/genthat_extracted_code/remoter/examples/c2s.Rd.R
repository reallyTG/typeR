library(remoter)


### Name: c2s
### Title: Client-to-Server Object Transfer
### Aliases: c2s

### ** Examples

## Not run: 
##D ### Prompts are listed to clarify when something is eval'd locally vs remotely
##D > library(remoter)
##D > x <- "some data"
##D > remoter::connect("my.remote.server")
##D remoter> x
##D ### Error: object 'x' not found
##D remoter> c2s(x)
##D remoter> x
##D ###  [1] "some data" 
## End(Not run)




