library(nws)


### Name: nwsOpenWs
### Title: Create and Own a netWorkSpace
### Aliases: nwsOpenWs nwsOpenWs-methods nwsOpenWs,nwsServer-method
### Keywords: methods

### ** Examples

## Not run: 
##D # example 1
##D nwss <- nwsServer()
##D ws <- nwsOpenWs(nwss, "nws example")
##D 
##D # example 2
##D xs <- nwsOpenWs(nwss, wsName='nws example', space=ws)
##D 
##D # example 3
##D ys <- nwsOpenWs(nwss, "persistent space", persistent=TRUE)
## End(Not run)



