library(pbdMPI)


### Name: alltoall
### Title: All to All
### Aliases: alltoall spmd.alltoall.integer spmd.alltoall.double
###   spmd.alltoall.raw spmd.alltoallv.integer spmd.alltoallv.double
###   spmd.alltoallv.raw
### Keywords: methods collective

### ** Examples

## Not run: 
##D ### Save code in a file "demo.r" and run with 2 processors by
##D ### SHELL> mpiexec -np 2 Rscript --vanilla [...].r
##D 
##D spmd.code <- "
##D ### Initial.
##D suppressMessages(library(pbdMPI, quietly = TRUE))
##D init()
##D .comm.size <- comm.size()
##D .comm.rank <- comm.rank()
##D 
##D ### Examples.
##D n <- as.integer(2)
##D x <- 1:(.comm.size * n)
##D comm.cat(\"Original x:\n\", quiet = TRUE)
##D comm.print(x, all.rank = TRUE)
##D 
##D x <- as.integer(x)
##D y <- spmd.alltoall.integer(x, integer(length(x)), n, n)
##D comm.cat(\"\nAlltoall y:\n\", quiet = TRUE)
##D comm.print(y, all.rank = TRUE)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



