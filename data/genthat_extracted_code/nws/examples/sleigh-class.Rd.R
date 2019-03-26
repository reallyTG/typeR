library(nws)


### Name: sleigh
### Title: Class "sleigh"
### Aliases: sleigh-class sleigh sleighPro initialize,sleigh-method
###   initialize
### Keywords: classes

### ** Examples

## Not run: 
##D # Default option: create three sleigh workers on local host:
##D s <- sleigh()
##D # which is equivalent to:
##D s <- sleigh(launch='local')
##D 
##D # Create sleigh workers on multiple machines using SSH:
##D s <- sleigh(nodeList=c('n1', 'n2', 'n3'), launch=sshcmd)
##D 
##D # Use the LSF bsub command to launch ten workers:
##D s <- sleigh(nodeList=rep('fake', 10), launch=lsfcmd)
##D 
##D # Use web launch:
##D s <- sleigh(launch='web')
## End(Not run)



