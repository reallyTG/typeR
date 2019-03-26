library(rscala)


### Name: scalaDisconnect
### Title: Temporarily Disconnect Scala by Closing Connections
### Aliases: scalaDisconnect

### ** Examples

## No test: 

showConnections()
s <- scala()
showConnections()         # No additional connections yet.
s * "3+4"
showConnections()         # Now there are two additional connections.
scalaDisconnect()
showConnections()         # The new connections are gone.
s * "3+4"
showConnections()         # New connections are established as needed.
close(s)
## End(No test)



