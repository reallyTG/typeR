library(bigGP)


### Name: localAssign
### Title: Assign a New Name to an Object on Slave Process
### Aliases: localAssign

### ** Examples

## Not run: 
##D bigGP.init(3)
##D mpi.bcast.cmd(e <- new.env())
##D mpi.bcast.cmd(a <- 7)
##D mpi.remote.exec(localAssign, "x", "a", objPos = "e")
##D mpi.remote.exec(e$x, ret = TRUE)
## End(Not run)



