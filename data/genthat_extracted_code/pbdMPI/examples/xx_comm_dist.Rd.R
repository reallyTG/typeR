library(pbdMPI)


### Name: global distance function
### Title: Global Distance for Distributed Matrices
### Aliases: comm.dist
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
##D comm.set.seed(123456, diff = TRUE)
##D 
##D X.gbd <- matrix(runif(6), ncol = 3)
##D dist.X.common <- comm.dist(X.gbd)
##D dist.X.gbd <- comm.dist(X.gbd, return.type = \"gbd\")
##D 
##D ### Verify.
##D dist.X <- dist(do.call(\"rbind\", allgather(X.gbd)))
##D comm.print(all(dist.X == dist.X.common))
##D 
##D ### Verify 2.
##D dist.X.df <- do.call(\"rbind\", allgather(dist.X.gbd))
##D comm.print(all(dist.X == dist.X.df[, 3]))
##D comm.print(dist.X)
##D comm.print(dist.X.df)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



