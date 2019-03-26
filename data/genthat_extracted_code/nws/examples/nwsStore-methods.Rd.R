library(nws)


### Name: nwsStore
### Title: Associate a Value with a Variable in netWorkSpace
### Aliases: nwsStore nwsStore-methods nwsStore,netWorkSpace-method
### Keywords: methods

### ** Examples

## Not run: 
##D ws <- netWorkSpace('nws example')
##D 
##D # To store value 5 bound to variable 'x' on the netWorkSpace 'ws'
##D # (If 'x' was declared, then its mode is inherited, 
##D # otherwise 'x' uses the default mode 'fifo')
##D nwsStore(ws, 'x', 5)
##D 
##D # store 10 values associate with variable y to the netWorkSpace
##D for (i in 1:10)
##D   nwsStore(ws, 'y', i)
##D 
##D # retrieve 10 values associate with variable y from the netWorkSpace
##D for (i in 1:10)
##D   print(nwsFetch(ws, 'y'))
## End(Not run)



