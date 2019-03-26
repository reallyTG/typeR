library(nws)


### Name: rshcmd
### Title: Sleigh Auxiliary Function
### Aliases: rshcmd
### Keywords: utilities

### ** Examples

## Not run: 
##D # Create a sleigh with workers on nodes n1 and n2 started via rsh:
##D s <- sleigh(launch=rshcmd, nodeList=c('n1', 'n2'))
##D 
##D # Same as previous, but as user 'frank':
##D s <- sleigh(launch=rshcmd, nodeList=c('n1', 'n2'), user='frank')
##D 
##D # Specify an alternate python interpreter and see the command
##D # and arguments that rshcmd returns:
##D defaultSleighOptions$python <- '/usr/local/bin/python'
##D rshcmd('node1', defaultSleighOptions)
## End(Not run)



