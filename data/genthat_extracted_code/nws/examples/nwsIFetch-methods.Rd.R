library(nws)


### Name: nwsIFetch
### Title: Iterate Through Values in a netWorkSpace Variable
### Aliases: nwsIFetch nwsIFetch-methods nwsIFetch,netWorkSpace-method
### Keywords: methods

### ** Examples

## Not run: 
##D ws <- netWorkSpace('nws example')
##D nwsStore(ws, 'x', 10)
##D it <- nwsIFetch(ws, 'x')
##D it()  # returns the value 10
##D it()  # blocks until another process stores a value in the variable
## End(Not run)



