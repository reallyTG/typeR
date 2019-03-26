library(pbdMPI)


### Name: sendrecv.replace-method
### Title: Send and Receive an Object to and from Other Ranks
### Aliases: sendrecv.replace-method sendrecv.replace,ANY-method
###   sendrecv.replace,integer-method sendrecv.replace,numeric-method
###   sendrecv.replace,raw-method sendrecv.replace
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
##D x <- sendrecv.replace(matrix(x, nrow = 1))
##D comm.print(x, rank.print = 1)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



