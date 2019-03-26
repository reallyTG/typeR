library(pbdMPI)


### Name: global writing
### Title: Global Writing Functions
### Aliases: comm.write comm.write.table comm.write.csv comm.write.csv2
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
##D if(comm.size() != 2){
##D   comm.cat(\"2 processors are requried.\n\", quiet = TRUE)
##D   finalize()
##D }
##D 
##D ### Examples.
##D comm.write((1:5) + comm.rank(), file = \"test.txt\")
##D 
##D ### Finish.
##D finalize()
##D "
##D # execmpi(spmd.code, nranks = 2L)
## End(Not run)



