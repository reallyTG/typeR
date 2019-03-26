library(remoter)


### Name: batch
### Title: Batch Execution
### Aliases: batch

### ** Examples

## Not run: 
##D library(remoter)
##D ### NOTE first run a server via remoter::server() )in a separate R session.
##D ### For simplicity, assume they are on the same machine.
##D 
##D # Run a script in an R file on the local/client machine
##D file <- "/path/to/an/R/script.r"
##D batch(file=file)
##D 
##D # Run a script stored in a character vector
##D script <- "1+1"
##D batch(script="1+1")
## End(Not run)




