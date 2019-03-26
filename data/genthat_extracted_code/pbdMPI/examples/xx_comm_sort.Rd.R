library(pbdMPI)


### Name: global sort
### Title: Global Quick Sort for Distributed Vectors or Matrices
### Aliases: comm.sort
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
##D .comm.size <- comm.size()
##D .comm.rank <- comm.rank()
##D 
##D ### Examples.
##D comm.set.seed(123456, diff = TRUE)
##D x <- c(rnorm(5 + .comm.rank * 2), NA)
##D # x <- sample(1:5, 5 + .comm.rank * 2, replace = TRUE)
##D comm.end.seed()
##D 
##D if(.comm.rank == 1){
##D   x <- NULL    ### Test for NULL or 0 vector
##D }
##D 
##D y <- allgather(x)
##D comm.print(y)
##D 
##D y <- comm.sort(x)
##D y <- allgather(y)
##D comm.print(y)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



