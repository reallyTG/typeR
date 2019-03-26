library(nws)


### Name: nwsIFetchTry
### Title: Iterate Through Values of a netWorkSpace Variable
### Aliases: nwsIFetchTry nwsIFetchTry-methods
###   nwsIFetchTry,netWorkSpace-method
### Keywords: methods

### ** Examples

## Not run: 
##D ws <- netWorkSpace('nws example')
##D nwsStore(ws, 'x', 10)
##D it <- nwsIFetchTry(ws, 'x', NA)
##D it()  # returns the value 10
##D it()  # returns NA
## End(Not run)



