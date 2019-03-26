library(pbdMPI)


### Name: global which, which.max, and which.min
### Title: Global Which Functions
### Aliases: comm.which comm.which.max comm.which.min
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
##D a <- 1:(comm.rank() + 1)
##D 
##D b <- comm.which(a == 2)
##D comm.print(b)
##D b <- comm.which.max(a)
##D comm.print(b)
##D b <- comm.which.min(a)
##D comm.print(b)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



