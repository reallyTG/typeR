library(nws)


### Name: sshcmd
### Title: Sleigh Auxiliary Function
### Aliases: sshcmd sshforwardcmd
### Keywords: utilities

### ** Examples

## Not run: 
##D # Create a sleigh with workers on nodes n1 and n2 started via ssh:
##D s <- sleigh(launch=sshcmd, nodeList=c('n1', 'n2'))
##D 
##D # Same as previous, but as user 'frank':
##D s <- sleigh(launch=sshcmd, nodeList=c('n1', 'n2'), user='frank')
##D 
##D # Create two tunnels from workers n1 and n2 back the nws server
##D # on the local machine:
##D s <- sleigh(launch=sshforwardcmd, nodeList=c('n1', 'n2'),
##D             nwsHostRemote='localhost')
##D 
##D # Same as the previous example, but use port 9876 in case either
##D # worker machine already has an nws server bound to port 8765:
##D s <- sleigh(launch=sshforwardcmd, nodeList=c('n1', 'n2'),
##D             nwsHostRemote='localhost', nwsPortRemote=9876)
## End(Not run)



