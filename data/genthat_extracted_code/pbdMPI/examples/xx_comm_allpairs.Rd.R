library(pbdMPI)


### Name: global all pairs
### Title: Global All Pairs
### Aliases: comm.allpairs
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
##D 
##D ### Examples.
##D id.matrix <- comm.allpairs(comm.size() + 1)
##D comm.print(id.matrix, all.rank = TRUE)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



