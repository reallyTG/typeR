library(pbdMPI)


### Name: seed for RNG
### Title: Seed Functions for Random Number Generators
### Aliases: comm.set.seed comm.seed.state comm.end.seed comm.reset.seed
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
##D comm.set.seed(123456)
##D comm.print(runif(5), all.rank = TRUE)
##D comm.reset.seed()
##D comm.print(runif(5), all.rank = TRUE)
##D comm.end.seed()
##D 
##D ### Obtain the seed state.
##D comm.set.seed(123456, diff = TRUE)
##D comm.print(runif(5), all.rank = TRUE)
##D saved.seed <- comm.seed.state()   ### save the state.
##D comm.print(runif(5), all.rank = TRUE)
##D comm.end.seed()
##D 
##D ### Start from a saved state.
##D comm.set.seed(123456, state = saved.seed) ### rewind to the state.
##D comm.print(runif(5), all.rank = TRUE)
##D comm.end.seed()
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



