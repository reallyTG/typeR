library(bigGP)


### Name: remoteCalc
### Title: Return a Distributed Vector to the Master Process
### Aliases: remoteCalc

### ** Examples

## Not run: 
##D bigGP.init(3)
##D mpi.bcast.cmd(x <- 0:mpi.comm.rank())
##D remoteCalc('x', FUN = exp, outputName = 'exp.x')
##D remoteLs()
##D pull('exp.x')
##D remoteCalc('x', 'exp.x', FUN = `+`, outputName = 'silly')
##D pull('silly')
## End(Not run)



