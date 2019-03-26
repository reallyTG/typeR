library(pbdMPI)


### Name: global stop and warning
### Title: Global Stop and Warning Functions
### Aliases: comm.stop comm.warning comm.warnings comm.stopifnot
### Keywords: utility

### ** Examples

## Not run: 
##D ### Save code in a file "demo.r" and run with 2 processors by
##D ### SHELL> mpiexec -np 2 Rscript demo.r
##D 
##D spmd.code <- "
##D ### Initial.
##D suppressMessages(library(pbdMPI, quietly = TRUE))
##D init()
##D if(comm.size() != 2){
##D   comm.cat(\"2 processors are requried.\n\", quiet = TRUE)
##D   finalize()
##D }
##D 
##D ### Examples.
##D comm.warning(\"test warning.\n\")
##D comm.warnings()
##D comm.stop(\"test stop.\n\")
##D comm.stopifnot(1 == 2)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



