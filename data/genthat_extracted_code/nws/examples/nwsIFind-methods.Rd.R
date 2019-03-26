library(nws)


### Name: nwsIFind
### Title: Iterate Through Stored Values of a netWorkSpace Variable
### Aliases: nwsIFind nwsIFind-methods nwsIFind,netWorkSpace-method
### Keywords: methods

### ** Examples

## Not run: 
##D ws <- netWorkSpace('nws example')
##D nwsStore(ws, 'x', 1)
##D nwsStore(ws, 'x', 2)
##D it <- nwsIFind(ws, 'x')
##D it()  # returns the value 1
##D it()  # returns the value 2
##D it()  # blocks until another process stores a value in the variable
## End(Not run)



