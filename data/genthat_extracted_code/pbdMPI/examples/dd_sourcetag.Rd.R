library(pbdMPI)


### Name: sourcetag
### Title: Functions to Obtain source and tag
### Aliases: anysource anytag get.sourcetag
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
##D if(.comm.size < 2)
##D   comm.stop(\"At least two processors are requried.\")
##D 
##D ### Examples.
##D if(.comm.rank != 0){
##D   send(as.integer(.comm.rank * 10), rank.dest = 0L,
##D        tag = as.integer(.comm.rank + 10))
##D }
##D if(.comm.rank == 0){
##D   for(i in 1:(.comm.size - 1)){
##D     ret <- recv(x.buffer = integer(1),
##D                 rank.source = anysource(), tag = anytag())
##D     sourcetag <- get.sourcetag()
##D     print(c(sourcetag, ret))
##D   }
##D }
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



