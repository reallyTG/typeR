library(pbdMPI)


### Name: communicator
### Title: Communicator Functions
### Aliases: barrier comm.is.null comm.rank comm.localrank comm.size
###   comm.dup comm.free init finalize is.finalized comm.abort comm.split
###   comm.disconnect comm.connect comm.accept port.open port.close
###   serv.publish serv.unpublish serv.lookup intercomm.merge
###   intercomm.create comm.c2f COMM.SIZE COMM.RANK
### Keywords: programming

### ** Examples

## Not run: 
##D ### Save code in a file "demo.r" and run with 2 processors by
##D ### SHELL> mpiexec -np 2 Rscript demo.r
##D 
##D spmd.code <- "
##D ### Initial.
##D suppressMessages(library(pbdMPI, quietly = TRUE))
##D init()
##D .comm.size <- comm.size()
##D .comm.rank <- comm.rank()
##D 
##D ### Examples .
##D comm.print(.comm.size)
##D comm.print(.comm.rank, all.rank = TRUE)
##D comm.print(comm.rank(), rank.print = 1)
##D comm.print(comm.c2f())
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



