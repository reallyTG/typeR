library(pbdMPI)


### Name: sendrecv-method
### Title: Send and Receive an Object to and from Other Ranks
### Aliases: sendrecv-method sendrecv,ANY,ANY-method
###   sendrecv,integer,integer-method sendrecv,numeric,numeric-method
###   sendrecv,raw,raw-method sendrecv
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
##D x <- (1:N) + N * .comm.size
##D y <- sendrecv(matrix(x, nrow = 1))
##D comm.print(y, rank.print = 1)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



