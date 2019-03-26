library(pbdMPI)


### Name: info
### Title: Info Functions
### Aliases: info.create info.set info.free info.c2f
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
##D ### Examples.
##D info.create(0L)
##D info.set(0L, \"file\", \"appschema\")
##D info.free(0L)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



