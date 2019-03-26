library(pbdMPI)


### Name: isend-method
### Title: A Rank Send (Nonblocking) an Object to the Other Rank
### Aliases: isend-method isend,ANY-method isend,integer-method
###   isend,numeric-method isend,raw-method isend
### Keywords: methods collective

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
##D N <- 5
##D x <- (1:N) + N * .comm.rank
##D if(.comm.rank == 0){
##D   y <- isend(matrix(x, nrow = 1))
##D } else if(.comm.rank == 1){
##D   y <- recv()
##D }
##D comm.print(y, rank.print = 1)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



