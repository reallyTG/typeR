library(rsconnect)


### Name: servers
### Title: Server Management Functions
### Aliases: servers discoverServers addConnectServer addServer
###   removeServer serverInfo addServerCertificate

### ** Examples

## Not run: 
##D 
##D # register a local server
##D addServer("http://myrsconnect/", "myserver")
##D 
##D # list servers
##D servers(local = TRUE)
##D 
##D # connect to an account on the server
##D connectUser(server = "myserver")
## End(Not run)



