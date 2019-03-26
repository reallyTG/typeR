library(nws)


### Name: nwsDeleteWs
### Title: Delete a netWorkSpace
### Aliases: nwsDeleteWs nwsDeleteWs-methods nwsDeleteWs,nwsServer-method
### Keywords: methods

### ** Examples

## Not run: 
##D # example 1
##D nwss <- nwsServer()
##D ws <- nwsOpenWs(nwss, "nws example")
##D # do some works
##D # ...
##D nwsDeleteWs(nwss, "nws example")
##D 
##D # example 2 illustrates accessing a server object 
##D # from the netWorkSpace class object
##D ws <- netWorkSpace("nws example 2")
##D # do some works 
##D # ...
##D nwsDeleteWs(ws@server, "nws example 2")
## End(Not run)



