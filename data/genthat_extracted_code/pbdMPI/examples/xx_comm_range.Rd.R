library(pbdMPI)


### Name: global range, max, and min
### Title: Global Range, Max, and Min Functions
### Aliases: comm.range comm.max comm.min
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
##D b <- comm.range(a)
##D comm.print(b)
##D b <- comm.max(a)
##D comm.print(b)
##D b <- comm.min(a)
##D comm.print(b)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



