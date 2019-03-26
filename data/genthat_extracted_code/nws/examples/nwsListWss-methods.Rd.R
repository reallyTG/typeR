library(nws)


### Name: nwsListWss
### Title: List All netWorkSpaces
### Aliases: nwsListWss nwsListWss-methods nwsListWss,nwsServer-method
### Keywords: methods

### ** Examples

## Not run: 
##D # example 1
##D nwss <- nwsServer()
##D ws1 <- nwsOpenWs(nwss, 'my space')
##D ws2 <- nwsOpenWs(nwss, 'other space')
##D write(nwsListWss(nwss), stdout())
##D 
##D # example 2
##D # retrieve all workspace names
##D df <- nwsListWss(nwss, showDataFrame=TRUE)
##D df$Name
##D $"1"
##D [1] "__default"
##D 
##D $"2"
##D [1] "my space"
##D 
##D $"3"
##D [1] "other space"
## End(Not run)



