library(nws)


### Name: nwsIFindTry
### Title: Iterate Through Stored Values of a netWorkSpace Variable
### Aliases: nwsIFindTry nwsIFindTry-methods
###   nwsIFindTry,netWorkSpace-method
### Keywords: methods

### ** Examples

## Not run: 
##D ws <- netWorkSpace('nws example')
##D nwsStore(ws, 'x', 1)
##D nwsStore(ws, 'x', 2)
##D it <- nwsIFindTry(ws, 'x', NA)
##D it()  # returns the value 1
##D it()  # returns the value 2
##D it()  # returns the value NA
##D nwsStore(ws, 'x', 3)
##D it()  # returns the value 3
##D it()  # returns the value NA
## End(Not run)



