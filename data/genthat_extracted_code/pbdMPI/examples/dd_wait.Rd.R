library(pbdMPI)


### Name: wait
### Title: Wait Functions
### Aliases: wait waitany waitsome waitall
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
##D N <- 5
##D x <- (1:N) + N * .comm.rank
##D if(.comm.rank == 0){
##D   isend(list(x))
##D }
##D if(.comm.rank == 1){
##D   y <- irecv(list(x))
##D }
##D wait()
##D comm.print(y, rank.print = 1L)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



