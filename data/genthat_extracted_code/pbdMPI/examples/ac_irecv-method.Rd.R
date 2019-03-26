library(pbdMPI)


### Name: irecv-method
### Title: A Rank Receives (Nonblocking) an Object from the Other Rank
### Aliases: irecv-method irecv,ANY-method irecv,integer-method
###   irecv,numeric-method irecv,raw-method irecv
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
##D   y <- send(matrix(x, nrow = 1))
##D } else if(.comm.rank == 1){
##D   y <- irecv()
##D }
##D comm.print(y, rank.print = 1)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



