library(pbdMPI)


### Name: global any and all
### Title: Global Any and All Functions
### Aliases: comm.any comm.all comm.allcommon
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
##D if(comm.rank() == 0){
##D   a <- c(T, F, NA)
##D } else{
##D   a <- T
##D }
##D 
##D comm.any(a)
##D comm.all(a)
##D comm.any(a, na.rm = TRUE)
##D comm.all(a, na.rm = TRUE)
##D 
##D comm.allcommon(1:3)
##D if(comm.rank() == 0){
##D   a <- 1:3
##D } else{
##D   a <- 3:1
##D }
##D comm.allcommon.integer(a)
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



