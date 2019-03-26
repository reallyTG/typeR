library(pbdMPI)


### Name: global pairwise
### Title: Global Pairwise Evaluations
### Aliases: comm.pairwise
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
##D comm.set.seed(123456, diff = FALSE)
##D X <- matrix(rnorm(10), ncol = 2)
##D id.matrix <- comm.allpairs(nrow(X))
##D 
##D ### Method original.
##D dist.org <- dist(X)
##D 
##D ### Method 1.
##D dist.common <- comm.pairwise(X, pairid.gbd = id.matrix)
##D 
##D ### Method 2.
##D # if(comm.rank() != 0){
##D #   X <- matrix(0, nrow = 0, ncol = 4)
##D # }
##D X.gbd <- comm.as.gbd(X)    ### The other way.
##D dist.gbd <- comm.pairwise(X.gbd)
##D 
##D ### Verify.
##D d.org <- as.vector(dist.org)
##D d.1 <- do.call(\"c\", allgather(dist.common[, 3]))
##D d.2 <- do.call(\"c\", allgather(dist.gbd[, 3]))
##D comm.print(all(d.org == d.1))
##D comm.print(all(d.org == d.2))
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



